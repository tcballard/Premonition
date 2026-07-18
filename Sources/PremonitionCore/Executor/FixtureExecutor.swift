import Foundation

public struct FixtureExecution: Codable, Equatable, Sendable {
    public let stdoutEvents: [String]
    public let eventOffsetsMilliseconds: [Int]
    public let stderr: String
    public let exitCode: Int32

    enum CodingKeys: String, CodingKey {
        case stdoutEvents = "stdout_events"
        case eventOffsetsMilliseconds = "event_offsets_ms"
        case stderr
        case exitCode = "exit_code"
    }

    public init(stdoutEvents: [String], eventOffsetsMilliseconds: [Int] = [],
                stderr: String, exitCode: Int32) {
        self.stdoutEvents = stdoutEvents
        self.eventOffsetsMilliseconds = eventOffsetsMilliseconds
        self.stderr = stderr
        self.exitCode = exitCode
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        stdoutEvents = try values.decodeIfPresent([String].self, forKey: .stdoutEvents) ?? []
        eventOffsetsMilliseconds = try values.decodeIfPresent([Int].self, forKey: .eventOffsetsMilliseconds) ?? []
        stderr = try values.decodeIfPresent(String.self, forKey: .stderr) ?? ""
        exitCode = try values.decodeIfPresent(Int32.self, forKey: .exitCode) ?? 0
    }
}

public struct FixtureReplayExecutor: Executor, Sendable {
    private let bundle: FixtureBundle
    private let speed: Double

    public init(bundle: FixtureBundle, speed: Double) {
        self.bundle = bundle
        self.speed = max(speed, 0.01)
    }

    public func run(request: ExecutorRequest,
                    onEvent: @escaping @Sendable (PipelineEvent) -> Void) async throws -> ExecutorResult {
        guard request.purpose != .rationale else { throw ExecutorError.missingFinalAnswer }
        guard bundle.execution.exitCode == 0 else {
            throw ExecutorError.nonZeroExit(bundle.execution.exitCode)
        }

        let parser = CodexJSONLParser()
        let offsets = normalizedOffsets(eventCount: bundle.events.count)
        var previousOffset = 0
        for (index, line) in bundle.events.enumerated() {
            try Task.checkCancellation()
            let offset = offsets[index]
            let delay = max(0, offset - previousOffset)
            if delay > 0 {
                try await Task.sleep(for: .milliseconds(Int(Double(delay) / speed)))
            }
            if let event = parser.event(from: line) { onEvent(event) }
            previousOffset = offset
        }

        return ExecutorResult(
            finalText: bundle.finalDiff,
            durationMilliseconds: Int(Double(offsets.last ?? 0) / speed)
        )
    }

    private func normalizedOffsets(eventCount: Int) -> [Int] {
        let recorded = bundle.execution.eventOffsetsMilliseconds
        guard recorded.count == eventCount,
              zip(recorded, recorded.dropFirst()).allSatisfy({ $0 <= $1 }) else {
            return (0..<eventCount).map { $0 * 250 }
        }
        return recorded
    }
}

public struct FixtureBundle: Equatable, Sendable {
    public let errorText: String
    public let events: [String]
    public let finalDiff: String
    public let execution: FixtureExecution

    public init(errorText: String, events: [String], finalDiff: String,
                execution: FixtureExecution) {
        self.errorText = errorText
        self.events = events
        self.finalDiff = finalDiff
        self.execution = execution
    }
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
