import Foundation

public struct FixtureExecution: Codable, Equatable, Sendable {
    public let stdoutEvents: [String]
    public let stderr: String
    public let exitCode: Int32

    enum CodingKeys: String, CodingKey {
        case stdoutEvents = "stdout_events"
        case stderr
        case exitCode = "exit_code"
    }
}

public struct FixtureBundle: Equatable, Sendable {
    public let errorText: String
    public let events: [String]
    public let finalDiff: String
    public let execution: FixtureExecution
}

public struct FixtureExecutor: Sendable {
    public init() {}
    public func replay(_ data: Data) throws -> FixtureExecution {
        try JSONDecoder().decode(FixtureExecution.self, from: data)
    }

    public func load(directory: URL, repositoryRoot: URL) throws -> FixtureBundle {
        let manager = FileManager.default
        guard manager.fileExists(atPath: directory.path) else { throw CocoaError(.fileNoSuchFile) }
        let token = "{{REPO_ROOT}}"
        func text(_ name: String) throws -> String {
            try String(contentsOf: directory.appendingPathComponent(name), encoding: .utf8)
                .replacingOccurrences(of: token, with: repositoryRoot.path)
        }
        let events = try text("events.jsonl").split(separator: "\n").map(String.init)
        let execution = try replay(Data(contentsOf: directory.appendingPathComponent("fixture.json")))
        return FixtureBundle(errorText: try text("error.txt"), events: events,
                             finalDiff: try text("final.diff"), execution: execution)
    }
}
