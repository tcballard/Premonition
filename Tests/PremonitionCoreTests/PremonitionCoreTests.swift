import Foundation
import Testing
@testable import PremonitionCore

@Test("S0 pins the macOS deployment floor")
func minimumMacOSVersionIsPinned() {
    #expect(PremonitionCore.minimumMacOSVersion == "14.0")
}

private final class FakePasteboardItem: PasteboardItem {
    let declaredTypes: Set<PasteboardType>
    let value: String?
    private(set) var reads = 0
    init(_ types: Set<PasteboardType>, _ value: String?) { declaredTypes = types; self.value = value }
    func readPlainText() -> String? { reads += 1; return value }
}

@Test("clipboard checks privacy types before reading content")
func clipboardPrivacyOrderingAndDeduplication() {
    var filter = ClipboardCandidateFilter()
    let concealed = FakePasteboardItem([.concealed, .plainText], "secret")
    #expect(filter.evaluate(concealed, now: .distantPast) == .concealedSkip)
    #expect(concealed.reads == 0)
    let plain = FakePasteboardItem([.plainText], "Traceback\n/a.py")
    guard case .candidate = filter.evaluate(plain, now: .distantPast) else { Issue.record("expected candidate"); return }
    guard case .duplicateDrop = filter.evaluate(plain, now: .distantPast.addingTimeInterval(1)) else {
        Issue.record("expected duplicate drop"); return
    }
}

@Test("gate recognizes the supported stack trace corpus", arguments: [
    "Traceback (most recent call last):\n  File \"/tmp/a.py\", line 4, in <module>\nValueError: bad",
    "Error: bad\n    at run (/tmp/a.js:2:3)",
    "thread 'main' panicked at 'bad', src/main.rs:4:2\nstack backtrace:",
    "java.lang.IllegalStateException: bad\n    at app.Main.run(Main.java:10)",
    "panic: bad\n\ngoroutine 1 [running]:\nmain.main()\n\t/tmp/main.go:3",
    "Build Error: failed in /tmp/Sample.swift\nmore context",
])
func supportedGateCorpus(sample: String) { #expect(ErrorGate().match(sample) != nil) }

@Test("gate rejects prose and single-line errors", arguments: ["Error: try /tmp/a.py", "This is ordinary\nmultiline prose", "hello"])
func negativeGateCorpus(sample: String) { #expect(ErrorGate().match(sample) == nil) }

@Test("daily cap rolls over by local calendar day")
func dailyCapRollover() {
    var calendar = Calendar(identifier: .gregorian); calendar.timeZone = TimeZone(secondsFromGMT: 0)!
    var cap = DailyCap(limit: 1, calendar: calendar)
    let day = Date(timeIntervalSince1970: 1_700_000_000)
    #expect(cap.admit(at: day) == .admitted(count: 1))
    #expect(cap.admit(at: day) == .capDrop(count: 1))
    #expect(cap.admit(at: day.addingTimeInterval(86_400)) == .admitted(count: 1))
}

@Test("configuration validation restores safety defaults")
func configurationValidation() {
    var config = PremonitionConfiguration()
    config.dailyCap = 0; config.model = "other"; config.timeouts.speculateSeconds = 0
    let warnings = config.validate()
    #expect(config.dailyCap == 30)
    #expect(config.model == "gpt-5.6-sol")
    #expect(warnings.contains("model"))
}

@Test("configuration load warns on unknown keys without broadening roots")
func configurationUnknownKeys() throws {
    let url = try temporaryDirectory().appendingPathComponent("config.json")
    defer { try? FileManager.default.removeItem(at: url.deletingLastPathComponent()) }
    try Data(#"{"allowlisted_roots":[],"mystery":true}"#.utf8).write(to: url)
    let (config, warnings) = try ConfigurationStore().load(from: url)
    #expect(config.allowlistedRoots.isEmpty); #expect(warnings.contains("unknown.mystery"))
}

@Test("verdict records contain hashes and decisions but no captured content")
func verdictIsContentFree() throws {
    let record = VerdictRecord(timestamp: .distantPast, candidateHash: "0123456789abcdef", verdict: .gateDrop,
                               effortRole: nil, repositoryRoot: nil, durationMilliseconds: nil, reason: "no_match")
    let text = String(decoding: try VerdictLogger().encode(record), as: UTF8.self)
    #expect(text.contains("candidate_hash")); #expect(!text.contains("clipboard")); #expect(!text.contains("content"))
}

private func temporaryDirectory() throws -> URL {
    let url = FileManager.default.temporaryDirectory.appendingPathComponent(UUID().uuidString)
    try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true)
    return url
}

@Test("resolver chooses the repository with the most matched canonical paths")
func repositoryResolution() throws {
    let root = try temporaryDirectory(); defer { try? FileManager.default.removeItem(at: root) }
    let a = root.appendingPathComponent("a"), b = root.appendingPathComponent("b")
    for repo in [a, b] {
        try FileManager.default.createDirectory(at: repo.appendingPathComponent(".git"), withIntermediateDirectories: true)
        try Data().write(to: repo.appendingPathComponent("file.swift"))
    }
    let result = RepositoryResolver().resolve(paths: [a.appendingPathComponent("file.swift").path, a.appendingPathComponent("file.swift").path,
                                                       b.appendingPathComponent("file.swift").path], allowlistedRoots: [root])
    #expect(result?.root == a.resolvingSymlinksInPath()); #expect(result?.matchedPathCount == 2)
}

@Test("resolver evaluates relative stack paths beneath allowlisted roots")
func relativeRepositoryResolution() throws {
    let root = try temporaryDirectory(); defer { try? FileManager.default.removeItem(at: root) }
    try FileManager.default.createDirectory(at: root.appendingPathComponent(".git"), withIntermediateDirectories: true)
    try FileManager.default.createDirectory(at: root.appendingPathComponent("Sources"), withIntermediateDirectories: true)
    try Data().write(to: root.appendingPathComponent("Sources/main.swift"))
    let result = RepositoryResolver().resolve(paths: ["Sources/main.swift"], allowlistedRoots: [root])
    #expect(result?.root == root.resolvingSymlinksInPath())
}

private let validPatch = """
diff --git a/file.txt b/file.txt
--- a/file.txt
+++ b/file.txt
@@ -1 +1 @@
-old
+new
"""

@Test("one canonical parser accepts a single surrounding fence")
func parsesFencedDiff() throws {
    let diff = try UnifiedDiffParser().parse("```diff\n\(validPatch)```")
    #expect(diff.files.count == 1); #expect(diff.files[0].newPath == "b/file.txt")
}

@Test("diff bounds reject traversal, metadata and binary patches", arguments: [
    "diff --git a/../x b/../x\n--- a/../x\n+++ b/../x\n@@ -1 +1 @@\n-a\n+b\n",
    "diff --git a/.git/config b/.git/config\n--- a/.git/config\n+++ b/.git/config\n@@ -1 +1 @@\n-a\n+b\n",
    "diff --git a/x b/x\nGIT binary patch\n",
])
func rejectsUnsafeDiff(sample: String) throws {
    let root = try temporaryDirectory(); defer { try? FileManager.default.removeItem(at: root) }
    #expect(throws: DiffError.self) {
        let diff = try UnifiedDiffParser().parse(sample)
        try DiffBoundsValidator().validate(diff, repositoryRoot: root)
    }
}

@Test("git apply check validates without mutating the repository")
func applyCheckDoesNotMutate() async throws {
    let root = try temporaryDirectory(); defer { try? FileManager.default.removeItem(at: root) }
    try Data("old\n".utf8).write(to: root.appendingPathComponent("file.txt"))
    _ = try await ProcessRunner().run(URL(fileURLWithPath: "/usr/bin/git"), arguments: ["init", "-q"], currentDirectory: root)
    let diff = try UnifiedDiffParser().parse(validPatch)
    try DiffBoundsValidator().validate(diff, repositoryRoot: root)
    try await GitApplyChecker().check(diff, repositoryRoot: root)
    #expect(try String(contentsOf: root.appendingPathComponent("file.txt"), encoding: .utf8) == "old\n")
}

@Test("process runner supplies stdin and captures bounded output")
func processRunner() async throws {
    final class Lines: @unchecked Sendable {
        let lock = NSLock(); var values: [String] = []
        func append(_ value: String) { lock.lock(); values.append(value); lock.unlock() }
    }
    let lines = Lines()
    let result = try await ProcessRunner().run(URL(fileURLWithPath: "/bin/cat"), stdin: Data("hello\nworld\n".utf8)) {
        lines.append($0)
    }
    #expect(result.status == 0); #expect(result.stdout == "hello\nworld\n"); #expect(lines.values == ["hello", "world"])
}

@Test("process runner cancellation terminates the child")
func processCancellation() async {
    let task = Task { try await ProcessRunner().run(URL(fileURLWithPath: "/bin/sleep"), arguments: ["5"]) }
    task.cancel()
    await #expect(throws: CancellationError.self) { try await task.value }
}

@Test("process runner terminates on timeout")
func processTimeout() async {
    await #expect(throws: ProcessRunnerError.timedOut) {
        try await ProcessRunner().run(URL(fileURLWithPath: "/bin/sleep"), arguments: ["2"], timeout: .milliseconds(20))
    }
}

@Test("held fixes enforce singleflight before cap admission")
func heldFixSingleflight() throws {
    var machine = CandidateStateMachine(dailyCap: DailyCap(limit: 1))
    #expect(machine.admit(hash: "one", at: .distantPast) == .admitted(count: 1))
    machine.hold(diff: try UnifiedDiffParser().parse(validPatch))
    #expect(machine.admit(hash: "two", at: .distantPast) == .singleflightDrop)
    machine.release()
    #expect(machine.admit(hash: "two", at: .distantPast) == .capDrop(count: 1))
}

@Test("fixture executor only replays local recorded events")
func fixtureReplay() throws {
    let data = Data(#"{"stdout_events":["started","completed"],"stderr":"","exit_code":0}"#.utf8)
    let result = try FixtureExecutor().replay(data)
    #expect(result.stdoutEvents == ["started", "completed"]); #expect(result.exitCode == 0)
}
