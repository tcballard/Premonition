import Foundation

public struct CodexExecutor: Executor, Sendable {
    public static let pinnedModel = "gpt-5.6-sol"
    private let executable: URL
    private let runner: ProcessRunner
    private let parser: CodexJSONLParser

    public init(executable: URL = URL(fileURLWithPath: "/opt/homebrew/bin/codex"),
                runner: ProcessRunner = .init(), parser: CodexJSONLParser = .init()) {
        self.executable = executable; self.runner = runner; self.parser = parser
    }

    public func run(request: ExecutorRequest,
                    onEvent: @escaping @Sendable (PipelineEvent) -> Void) async throws -> ExecutorResult {
        guard request.model == Self.pinnedModel else { throw ExecutorError.invalidModel }
        let arguments = Self.arguments(effort: request.effort)
        let clock = ContinuousClock(), start = clock.now
        let result = try await runner.run(executable, arguments: arguments, currentDirectory: request.repositoryRoot,
                                          stdin: Data(request.prompt.utf8), timeout: request.timeout) { line in
            if let event = parser.event(from: line) { onEvent(event) }
        }
        guard result.status == 0 else { throw ExecutorError.nonZeroExit(result.status) }
        let parsed = try parser.parse(result.stdout)
        let elapsed = start.duration(to: clock.now)
        let milliseconds = Int(elapsed.components.seconds * 1_000) + Int(elapsed.components.attoseconds / 1_000_000_000_000_000)
        return ExecutorResult(finalText: parsed.finalText, durationMilliseconds: milliseconds)
    }

    public static func arguments(effort: ReasoningEffort) -> [String] {
        [
            "--ask-for-approval", "never", "exec", "--json", "--sandbox", "read-only",
            "--ephemeral", "--ignore-user-config", "--model", Self.pinnedModel,
            "-c", "model_reasoning_effort=\"\(effort.rawValue)\"", "-",
        ]
    }
}
