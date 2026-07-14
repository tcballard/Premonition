import Foundation

public enum ExecutorPurpose: String, Sendable { case speculation, escalation, rationale }
public enum ReasoningEffort: String, Sendable { case low, medium, high }

public struct ExecutorRequest: Sendable {
    public let purpose: ExecutorPurpose
    public let prompt: String
    public let model: String
    public let effort: ReasoningEffort
    public let repositoryRoot: URL
    public let timeout: Duration

    public init(purpose: ExecutorPurpose, prompt: String, model: String = "gpt-5.6-sol",
                effort: ReasoningEffort, repositoryRoot: URL, timeout: Duration) {
        self.purpose = purpose; self.prompt = prompt; self.model = model
        self.effort = effort; self.repositoryRoot = repositoryRoot; self.timeout = timeout
    }
}

public enum PipelineEvent: Equatable, Sendable {
    case started, turnStarted, narration(String), completed, unknown(String)
}

public struct ExecutorResult: Equatable, Sendable {
    public let finalText: String
    public let durationMilliseconds: Int
}

public protocol Executor: Sendable {
    func run(request: ExecutorRequest, onEvent: @escaping @Sendable (PipelineEvent) -> Void) async throws -> ExecutorResult
}

public enum ExecutorError: Error, Equatable, Sendable {
    case invalidModel, malformedJSONL, missingFinalAnswer, incompleteTurn, nonZeroExit(Int32)
}
