import Foundation

public enum SpeculationOutcome: Equatable, Sendable {
    case fixReady(UnifiedDiff, calls: Int)
    case discarded(calls: Int)
}

public struct SpeculationPipeline<E: Executor>: Sendable {
    private let executor: E
    public init(executor: E) { self.executor = executor }

    public func run(prompt: String, repositoryRoot: URL,
                    onEvent: @escaping @Sendable (PipelineEvent) -> Void = { _ in }) async -> SpeculationOutcome {
        let first = ExecutorRequest(purpose: .speculation, prompt: prompt, effort: .low,
                                    repositoryRoot: repositoryRoot, timeout: .seconds(120))
        if let diff = await attempt(first, root: repositoryRoot, onEvent: onEvent) { return .fixReady(diff, calls: 1) }
        if Task.isCancelled { return .discarded(calls: 1) }
        let second = ExecutorRequest(purpose: .escalation, prompt: prompt, effort: .medium,
                                     repositoryRoot: repositoryRoot, timeout: .seconds(120))
        if let diff = await attempt(second, root: repositoryRoot, onEvent: onEvent) { return .fixReady(diff, calls: 2) }
        return .discarded(calls: 2)
    }

    public func rationale(prompt: String, repositoryRoot: URL) async -> String? {
        let request = ExecutorRequest(purpose: .rationale, prompt: prompt, effort: .low,
                                      repositoryRoot: repositoryRoot, timeout: .seconds(30))
        do {
            let result = try await executor.run(request: request, onEvent: { _ in })
            return RationaleValidator().validate(result.finalText)
        } catch { return nil }
    }

    private func attempt(_ request: ExecutorRequest, root: URL,
                         onEvent: @escaping @Sendable (PipelineEvent) -> Void) async -> UnifiedDiff? {
        do {
            try Task.checkCancellation()
            let result = try await executor.run(request: request, onEvent: onEvent)
            let diff = try UnifiedDiffParser().parse(result.finalText)
            try DiffBoundsValidator().validate(diff, repositoryRoot: root)
            try await GitApplyChecker().check(diff, repositoryRoot: root)
            return diff
        } catch { return nil }
    }
}

public struct RationaleValidator: Sendable {
    public init() {}
    public func validate(_ output: String) -> String? {
        let trimmed = output.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.contains("```"), !trimmed.contains("diff --git") else { return nil }
        let lines = trimmed.split(separator: "\n").map { $0.trimmingCharacters(in: .whitespaces) }.filter { !$0.isEmpty }
        guard !lines.isEmpty else { return nil }
        let result = lines.prefix(2).joined(separator: "\n")
        return result.count <= 240 ? result : nil
    }
}
