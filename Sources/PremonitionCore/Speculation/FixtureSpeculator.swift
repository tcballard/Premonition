import Foundation

public enum FixtureAttempt: Equatable, Sendable {
    case valid(UnifiedDiff)
    case executionFailure
    case validationFailure
    case timeout
}

public enum FixtureSpeculationOutcome: Equatable, Sendable {
    case fixReady(UnifiedDiff, calls: Int)
    case discarded(calls: Int)
}

public struct FixtureSpeculator: Sendable {
    public init() {}

    public func run(initial: FixtureAttempt, escalation: FixtureAttempt?) -> FixtureSpeculationOutcome {
        if case let .valid(diff) = initial { return .fixReady(diff, calls: 1) }
        guard let escalation else { return .discarded(calls: 1) }
        if case let .valid(diff) = escalation { return .fixReady(diff, calls: 2) }
        return .discarded(calls: 2)
    }
}
