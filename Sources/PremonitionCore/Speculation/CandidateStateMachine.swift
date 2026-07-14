import Foundation

public enum CandidateState: Equatable, Sendable {
    case idle
    case executing(hash: String)
    case fixReady(hash: String, diff: UnifiedDiff)
}

public enum CandidateAdmission: Equatable, Sendable {
    case admitted(count: Int)
    case singleflightDrop
    case capDrop(count: Int)
}

public struct CandidateStateMachine: Sendable {
    public private(set) var state: CandidateState = .idle
    private var cap: DailyCap

    public init(dailyCap: DailyCap) { self.cap = dailyCap }

    public mutating func admit(hash: String, at date: Date) -> CandidateAdmission {
        guard state == .idle else { return .singleflightDrop }
        switch cap.admit(at: date) {
        case let .capDrop(count): return .capDrop(count: count)
        case let .admitted(count): state = .executing(hash: hash); return .admitted(count: count)
        }
    }

    public mutating func hold(diff: UnifiedDiff) {
        guard case let .executing(hash) = state else { return }
        state = .fixReady(hash: hash, diff: diff)
    }

    public mutating func release() { state = .idle }
}
