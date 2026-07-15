import AppKit
import Observation
import PremonitionCore

@MainActor @Observable
final class PresentationModel {
    enum Status: Equatable { case notConfigured, watching, speculating, fixReady, paused }

    var status: Status = .notConfigured { didSet { onStatusChange?() } }
    var onStatusChange: (() -> Void)?
    var isPaused = false { didSet { status = isPaused ? .paused : (configuration.allowlistedRoots.isEmpty ? .notConfigured : .watching) } }
    var configuration = PremonitionConfiguration()
    var configurationWarning: String?
    var heldFix: HeldFix?
    var lastRunStatus = Strings.noRunsYet
    var applyEnabled = false
    var codexStatus = Strings.notChecked
    var dailyCount: Int { machine.capState.capCount }

    struct HeldFix: Equatable {
        let diff: UnifiedDiff
        let repositoryRoot: URL
        let errorLine: String
        let repositoryName: String
        var rationale: String?
    }

    private var filter = ClipboardCandidateFilter()
    private var machine = CandidateStateMachine(dailyCap: DailyCap(limit: 30))
    private let watcher = PasteboardWatcher()
    private var debounceTask: Task<Void, Never>?
    private var pipelineTask: Task<Void, Never>?
    private var expiryTask: Task<Void, Never>?
    private var activeHash: String?

    let configurationURL = FileManager.default.homeDirectoryForCurrentUser
        .appendingPathComponent("Library/Application Support/Premonition/config.json")
    private var stateURL: URL { configurationURL.deletingLastPathComponent().appendingPathComponent("state.json") }

    init() {
        load()
        let persisted = (try? Data(contentsOf: stateURL)).flatMap { try? JSONDecoder().decode(PersistentState.self, from: $0) }
        let capState = DailyCapState(capDate: persisted?.capDate ?? "", capCount: persisted?.capCount ?? 0)
        machine = CandidateStateMachine(dailyCap: DailyCap(limit: configuration.dailyCap, state: capState))
        watcher.onItem = { [weak self] item in self?.observe(item) }
    }

    func startWatching() { if !isPaused { watcher.start() } }

    func load() {
        guard FileManager.default.fileExists(atPath: configurationURL.path) else { status = .notConfigured; return }
        do {
            let loaded = try ConfigurationStore().load(from: configurationURL)
            configuration = loaded.0
            configurationWarning = loaded.1.isEmpty ? nil : Strings.configurationWarning
            status = configuration.allowlistedRoots.isEmpty ? .notConfigured : .watching
        } catch { configurationWarning = Strings.configurationLoadFailed; status = .notConfigured }
    }

    func addRoot() {
        let panel = NSOpenPanel(); panel.canChooseDirectories = true; panel.canChooseFiles = false
        panel.allowsMultipleSelection = false; panel.prompt = Strings.addRoot
        guard panel.runModal() == .OK, let url = panel.url else { return }
        let path = url.standardizedFileURL.resolvingSymlinksInPath().path
        if !configuration.allowlistedRoots.contains(path) { configuration.allowlistedRoots.append(path); save() }
    }

    func removeRoot(_ path: String) { configuration.allowlistedRoots.removeAll { $0 == path }; save() }
    func refreshCodexStatus() async {
        let executable = URL(fileURLWithPath: configuration.codexPath ?? "/opt/homebrew/bin/codex")
        guard FileManager.default.isExecutableFile(atPath: executable.path) else { codexStatus = Strings.notFound; return }
        do {
            let result = try await ProcessRunner().run(executable, arguments: ["--version"], timeout: .seconds(5))
            let version = result.stdout.trimmingCharacters(in: .whitespacesAndNewlines)
            codexStatus = result.status == 0 && !version.isEmpty ? version : Strings.notFound
        } catch { codexStatus = Strings.notFound }
    }
    func openConfigFile() { if FileManager.default.fileExists(atPath: configurationURL.path) { NSWorkspace.shared.open(configurationURL) } }
    func quit() { NSApp.terminate(nil) }
    func save() {
        do { try ConfigurationStore().save(configuration, to: configurationURL); configurationWarning = nil }
        catch { configurationWarning = Strings.configurationSaveFailed }
        status = isPaused ? .paused : (configuration.allowlistedRoots.isEmpty ? .notConfigured : .watching)
    }

    private func observe(_ item: PasteboardItem) {
        guard !isPaused else { return }
        switch filter.evaluate(item, now: Date()) {
        case let .candidate(text, hash):
            debounceTask?.cancel()
            debounceTask = Task { [weak self] in
                try? await Task.sleep(for: .seconds(2)); guard !Task.isCancelled else { return }
                await self?.admit(text: text, hash: hash)
            }
        case .concealedSkip: activeHash = nil; record(.concealedSkip)
        case .sizeDrop: activeHash = nil; record(.sizeDrop)
        case let .duplicateDrop(hash): activeHash = hash; record(.duplicateDrop)
        case .unsupportedType: break
        }
    }

    private func admit(text: String, hash: String) async {
        activeHash = hash
        guard let gate = ErrorGate().match(text) else { lastRunStatus = Strings.gateDropped; record(.gateDrop); return }
        let roots = configuration.allowlistedRoots.map { URL(fileURLWithPath: $0) }
        guard let resolution = RepositoryResolver().resolve(paths: gate.extractedPaths, allowlistedRoots: roots) else {
            lastRunStatus = Strings.repositoryNotResolved; record(.resolveDrop); return
        }
        switch machine.admit(hash: hash, at: Date()) {
        case .singleflightDrop: lastRunStatus = Strings.alreadyWorking; record(.singleflightDrop); return
        case .capDrop: lastRunStatus = Strings.dailyCapReached; record(.capDrop); return
        case .admitted: break
        }
        persistCapState()
        activeHash = hash
        status = .speculating; lastRunStatus = Strings.speculating
        record(.executionStart, effort: ExecutorPurpose.speculation.rawValue, repository: resolution.root)
        let prompt = PromptBuilder().speculation(error: text)
        let executable = URL(fileURLWithPath: configuration.codexPath ?? "/opt/homebrew/bin/codex")
        pipelineTask = Task { [weak self] in
            guard let self else { return }
            let pipeline = SpeculationPipeline(executor: CodexExecutor(executable: executable) { [weak self] purpose in
                Task { @MainActor in
                    if purpose == .escalation { self?.record(.escalate, effort: purpose.rawValue, repository: resolution.root) }
                    self?.record(.egress, effort: purpose.rawValue, repository: resolution.root)
                }
            })
            let outcome = await pipeline.run(prompt: prompt, repositoryRoot: resolution.root)
            guard !Task.isCancelled else { machine.release(); pipelineTask = nil; status = .watching; return }
            switch outcome {
            case let .fixReady(diff, _):
                machine.hold(diff: diff)
                heldFix = HeldFix(diff: diff, repositoryRoot: resolution.root,
                                  errorLine: text.split(separator: "\n").first.map(String.init) ?? Strings.error,
                                  repositoryName: resolution.root.lastPathComponent)
                applyEnabled = (try? await PatchApplier().isClean(repositoryRoot: resolution.root)) ?? false
                status = .fixReady; lastRunStatus = Strings.fixReady
                record(.fixReady, repository: resolution.root)
                expiryTask?.cancel()
                expiryTask = Task { [weak self] in
                    try? await Task.sleep(for: .seconds(600)); guard !Task.isCancelled else { return }
                    if self?.heldFix?.diff == diff { self?.record(.expired); self?.lastRunStatus = Strings.expired; self?.releaseFix() }
                }
                Task { [weak self] in
                    let rationalePrompt = PromptBuilder().rationale(error: text, diff: diff)
                    let rationale = await pipeline.rationale(prompt: rationalePrompt, repositoryRoot: resolution.root)
                    if self?.heldFix?.diff == diff { self?.heldFix?.rationale = rationale }
                }
            case .discarded:
                machine.release(); status = .watching; lastRunStatus = Strings.noApplicableFix; record(.validationDiscard, repository: resolution.root)
            }
            pipelineTask = nil
        }
    }

    func setPaused(_ paused: Bool) {
        isPaused = paused
        if paused {
            watcher.stop(); debounceTask?.cancel()
            if pipelineTask != nil { record(.cancelled) }
            pipelineTask?.cancel(); pipelineTask = nil; expiryTask?.cancel(); machine.release(); heldFix = nil; record(.paused)
        }
        else { watcher.start(); record(.resumed) }
    }

    func popoverPresented() {
        guard let fix = heldFix else { return }
        record(.presented)
        Task { [weak self] in
            let clean = (try? await PatchApplier().isClean(repositoryRoot: fix.repositoryRoot)) ?? false
            if self?.heldFix?.diff == fix.diff { self?.applyEnabled = clean }
        }
    }

    func dismissFix() { record(.dismissed); releaseFix() }
    func copyPatch() {
        guard let fix = heldFix else { return }
        NSPasteboard.general.clearContents(); NSPasteboard.general.setString(fix.diff.text, forType: .string)
        record(.copied); lastRunStatus = Strings.patchCopied; releaseFix()
    }
    func applyFix() async {
        guard let fix = heldFix else { return }
        do { try await PatchApplier().apply(fix.diff, repositoryRoot: fix.repositoryRoot); record(.applied, repository: fix.repositoryRoot); lastRunStatus = Strings.applied; releaseFix() }
        catch {
            record(.applyFailed, repository: fix.repositoryRoot); applyEnabled = false; lastRunStatus = Strings.applyFailed
            NSAccessibility.post(element: NSApplication.shared, notification: .announcementRequested,
                                 userInfo: [.announcement: Strings.applyFailed,
                                            .priority: NSAccessibilityPriorityLevel.high.rawValue])
        }
    }

    private func record(_ verdict: VerdictKind, effort: String? = nil, repository: URL? = nil) {
        let record = VerdictRecord(timestamp: Date(), candidateHash: activeHash, verdict: verdict,
                                   effortRole: effort, repositoryRoot: repository?.path)
        guard let data = try? VerdictLogger().encode(record) else { return }
        let url = configurationURL.deletingLastPathComponent().appendingPathComponent("verdicts.jsonl")
        try? FileManager.default.createDirectory(at: url.deletingLastPathComponent(), withIntermediateDirectories: true)
        if !FileManager.default.fileExists(atPath: url.path) { FileManager.default.createFile(atPath: url.path, contents: nil) }
        if let handle = try? FileHandle(forWritingTo: url) { _ = try? handle.seekToEnd(); try? handle.write(contentsOf: data); try? handle.close() }
        try? FileManager.default.setAttributes([.posixPermissions: 0o600], ofItemAtPath: url.path)
    }

    private func releaseFix() {
        expiryTask?.cancel(); heldFix = nil; applyEnabled = false; machine.release()
        status = isPaused ? .paused : .watching
    }

    private func persistCapState() {
        var state = PersistentState(); state.capDate = machine.capState.capDate; state.capCount = machine.capState.capCount
        guard let data = try? JSONEncoder().encode(state) else { return }
        try? FileManager.default.createDirectory(at: stateURL.deletingLastPathComponent(), withIntermediateDirectories: true)
        try? data.write(to: stateURL, options: .atomic)
        try? FileManager.default.setAttributes([.posixPermissions: 0o600], ofItemAtPath: stateURL.path)
    }
}

@MainActor enum AppServices { static let presentation = PresentationModel() }
