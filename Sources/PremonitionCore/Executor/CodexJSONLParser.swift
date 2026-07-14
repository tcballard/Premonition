import Foundation

public struct CodexJSONLResult: Equatable, Sendable {
    public let events: [PipelineEvent]
    public let finalText: String
}

public struct CodexJSONLParser: Sendable {
    public init() {}

    public func parse(_ text: String) throws -> CodexJSONLResult {
        var events: [PipelineEvent] = [], final: String?
        var completed = false
        for line in text.split(separator: "\n", omittingEmptySubsequences: true) {
            guard let object = try JSONSerialization.jsonObject(with: Data(line.utf8)) as? [String: Any],
                  let type = object["type"] as? String else { throw ExecutorError.malformedJSONL }
            switch type {
            case "thread.started": events.append(.started)
            case "turn.started": events.append(.turnStarted)
            case "item.completed":
                if let item = object["item"] as? [String: Any], item["type"] as? String == "agent_message",
                   let value = item["text"] as? String {
                    final = value; events.append(.narration(value))
                }
            case "turn.completed": completed = true; events.append(.completed)
            default: events.append(.unknown(type))
            }
        }
        guard completed else { throw ExecutorError.incompleteTurn }
        guard let final, !final.isEmpty else { throw ExecutorError.missingFinalAnswer }
        return CodexJSONLResult(events: events, finalText: final)
    }

    public func event(from line: String) -> PipelineEvent? {
        guard let object = try? JSONSerialization.jsonObject(with: Data(line.utf8)) as? [String: Any],
              let type = object["type"] as? String else { return nil }
        switch type {
        case "thread.started": return .started
        case "turn.started": return .turnStarted
        case "turn.completed": return .completed
        case "item.completed":
            if let item = object["item"] as? [String: Any], item["type"] as? String == "agent_message",
               let value = item["text"] as? String { return .narration(value) }
            return nil
        default: return .unknown(type)
        }
    }
}
