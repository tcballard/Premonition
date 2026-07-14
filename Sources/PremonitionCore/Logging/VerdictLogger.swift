import Foundation

public enum VerdictKind: String, Codable, Sendable {
    case gateDrop = "gate_drop"
    case sizeDrop = "size_drop"
    case duplicateDrop = "dup_drop"
    case concealedSkip = "concealed_skip"
    case resolveDrop = "resolve_drop"
    case singleflightDrop = "singleflight_drop"
    case capDrop = "cap_drop"
    case executionStart = "exec_start"
    case egress
    case executionTimeout = "exec_timeout"
    case executionError = "exec_error"
    case escalate
    case validationDiscard = "validate_discard"
    case fixReady = "fix_ready"
    case presented, applied
    case applyFailed = "apply_failed"
    case copied, dismissed, expired
    case cancelled
    case paused, resumed
}

public struct VerdictRecord: Codable, Equatable, Sendable {
    public let timestamp: Date
    public let candidateHash: String?
    public let verdict: VerdictKind
    public let effortRole: String?
    public let repositoryRoot: String?
    public let durationMilliseconds: Int?
    public let reason: String?

    enum CodingKeys: String, CodingKey {
        case timestamp
        case candidateHash = "candidate_hash"
        case verdict
        case effortRole = "effort_role"
        case repositoryRoot = "repository_root"
        case durationMilliseconds = "duration_ms"
        case reason
    }

    public init(timestamp: Date, candidateHash: String?, verdict: VerdictKind, effortRole: String? = nil,
                repositoryRoot: String? = nil, durationMilliseconds: Int? = nil, reason: String? = nil) {
        self.timestamp = timestamp; self.candidateHash = candidateHash; self.verdict = verdict
        self.effortRole = effortRole; self.repositoryRoot = repositoryRoot
        self.durationMilliseconds = durationMilliseconds; self.reason = reason
    }
}

public struct VerdictLogger: Sendable {
    public init() {}

    public func encode(_ record: VerdictRecord) throws -> Data {
        guard record.candidateHash.map({ $0.count == 16 && $0.allSatisfy(\.isHexDigit) }) ?? true else {
            throw VerdictLoggerError.invalidHash
        }
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        encoder.outputFormatting = [.sortedKeys]
        var data = try encoder.encode(record)
        data.append(0x0A)
        return data
    }
}

public enum VerdictLoggerError: Error {
    case invalidHash
}
