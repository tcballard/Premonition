import Foundation

public struct ReasoningEfforts: Codable, Equatable, Sendable {
    public var initial: String = "low"
    public var escalation: String = "medium"
    public var rationale: String = "low"

    public init() {}
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        initial = try values.decodeIfPresent(String.self, forKey: .initial) ?? "low"
        escalation = try values.decodeIfPresent(String.self, forKey: .escalation) ?? "medium"
        rationale = try values.decodeIfPresent(String.self, forKey: .rationale) ?? "low"
    }
    private enum CodingKeys: String, CodingKey { case initial, escalation, rationale }
}

public struct Timeouts: Codable, Equatable, Sendable {
    public var speculateSeconds: Int = 120
    public var rationaleSeconds: Int = 30

    enum CodingKeys: String, CodingKey {
        case speculateSeconds = "speculate_seconds"
        case rationaleSeconds = "rationale_seconds"
    }
    public init() {}
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        speculateSeconds = try values.decodeIfPresent(Int.self, forKey: .speculateSeconds) ?? 120
        rationaleSeconds = try values.decodeIfPresent(Int.self, forKey: .rationaleSeconds) ?? 30
    }
}

public struct PremonitionConfiguration: Codable, Equatable, Sendable {
    public var allowlistedRoots: [String] = []
    public var dailyCap: Int = 30
    public var model: String = "gpt-5.6-sol"
    public var reasoningEffort = ReasoningEfforts()
    public var timeouts = Timeouts()
    public var renderBudgetLines: Int = 120
    public var surfaceMode: String = "quiet"
    public var soundOnReady: Bool = false
    public var codexPath: String?
    public var fixturePath: String?
    public var fixtureSpeed: Double = 1.0
    public var debug = DebugConfiguration()

    enum CodingKeys: String, CodingKey {
        case allowlistedRoots = "allowlisted_roots"
        case dailyCap = "daily_cap"
        case model
        case reasoningEffort = "reasoning_effort"
        case timeouts
        case renderBudgetLines = "render_budget_lines"
        case surfaceMode = "surface_mode"
        case soundOnReady = "sound_on_ready"
        case codexPath = "codex_path"
        case fixturePath = "fixture_path"
        case fixtureSpeed = "fixture_speed"
        case debug
    }

    public init() {}

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        allowlistedRoots = try values.decodeIfPresent([String].self, forKey: .allowlistedRoots) ?? []
        dailyCap = try values.decodeIfPresent(Int.self, forKey: .dailyCap) ?? 30
        model = try values.decodeIfPresent(String.self, forKey: .model) ?? "gpt-5.6-sol"
        reasoningEffort = try values.decodeIfPresent(ReasoningEfforts.self, forKey: .reasoningEffort) ?? .init()
        timeouts = try values.decodeIfPresent(Timeouts.self, forKey: .timeouts) ?? .init()
        renderBudgetLines = try values.decodeIfPresent(Int.self, forKey: .renderBudgetLines) ?? 120
        surfaceMode = try values.decodeIfPresent(String.self, forKey: .surfaceMode) ?? "quiet"
        soundOnReady = try values.decodeIfPresent(Bool.self, forKey: .soundOnReady) ?? false
        codexPath = try values.decodeIfPresent(String.self, forKey: .codexPath)
        fixturePath = try values.decodeIfPresent(String.self, forKey: .fixturePath)
        fixtureSpeed = try values.decodeIfPresent(Double.self, forKey: .fixtureSpeed) ?? 1
        debug = try values.decodeIfPresent(DebugConfiguration.self, forKey: .debug) ?? .init()
    }

    public mutating func validate() -> [String] {
        var warnings: [String] = []
        if !(1...1_000).contains(dailyCap) {
            dailyCap = 30
            warnings.append("daily_cap")
        }
        if model != "gpt-5.6-sol" {
            model = "gpt-5.6-sol"
            warnings.append("model")
        }
        if timeouts.speculateSeconds <= 0 {
            timeouts.speculateSeconds = 120
            warnings.append("timeouts.speculate_seconds")
        }
        if timeouts.rationaleSeconds <= 0 {
            timeouts.rationaleSeconds = 30
            warnings.append("timeouts.rationale_seconds")
        }
        if renderBudgetLines <= 0 {
            renderBudgetLines = 120
            warnings.append("render_budget_lines")
        }
        if !["quiet", "demo"].contains(surfaceMode) {
            surfaceMode = "quiet"
            warnings.append("surface_mode")
        }
        if fixtureSpeed <= 0 { fixtureSpeed = 1.0; warnings.append("fixture_speed") }
        let efforts = [reasoningEffort.initial, reasoningEffort.escalation, reasoningEffort.rationale]
        if efforts.contains(where: { !["low", "medium", "high"].contains($0) }) {
            reasoningEffort = ReasoningEfforts(); warnings.append("reasoning_effort")
        }
        return warnings
    }
}

public struct ConfigurationStore: Sendable {
    public init() {}

    public func load(from url: URL) throws -> (PremonitionConfiguration, [String]) {
        let data = try Data(contentsOf: url)
        var configuration = try JSONDecoder().decode(PremonitionConfiguration.self, from: data)
        var warnings = configuration.validate()
        if let object = try JSONSerialization.jsonObject(with: data) as? [String: Any] {
            let known: Set<String> = ["allowlisted_roots", "daily_cap", "model", "reasoning_effort", "timeouts",
                                      "render_budget_lines", "surface_mode", "sound_on_ready", "codex_path",
                                      "fixture_path", "fixture_speed", "debug"]
            warnings.append(contentsOf: object.keys.filter { !known.contains($0) }.sorted().map { "unknown.\($0)" })
        }
        return (configuration, warnings)
    }

    public func save(_ configuration: PremonitionConfiguration, to url: URL) throws {
        let parent = url.deletingLastPathComponent()
        try FileManager.default.createDirectory(at: parent, withIntermediateDirectories: true)
        let data = try JSONEncoder.sorted.encode(configuration)
        let temporary = parent.appendingPathComponent(".\(url.lastPathComponent).\(UUID().uuidString).tmp")
        try data.write(to: temporary, options: [.atomic])
        try FileManager.default.setAttributes([.posixPermissions: 0o600], ofItemAtPath: temporary.path)
        if FileManager.default.fileExists(atPath: url.path) {
            _ = try FileManager.default.replaceItemAt(url, withItemAt: temporary)
        } else {
            try FileManager.default.moveItem(at: temporary, to: url)
        }
    }
}

public struct DebugConfiguration: Codable, Equatable, Sendable {
    public var logEgress = false
    enum CodingKeys: String, CodingKey { case logEgress = "log_egress" }
    public init() {}
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        logEgress = try values.decodeIfPresent(Bool.self, forKey: .logEgress) ?? false
    }
}

private extension JSONEncoder {
    static var sorted: JSONEncoder {
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.prettyPrinted, .sortedKeys, .withoutEscapingSlashes]
        return encoder
    }
}
