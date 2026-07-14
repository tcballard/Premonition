import Foundation

public struct DailyCapState: Codable, Equatable, Sendable {
    public var capDate: String
    public var capCount: Int

    enum CodingKeys: String, CodingKey {
        case capDate = "cap_date"
        case capCount = "cap_count"
    }

    public init(capDate: String = "", capCount: Int = 0) {
        self.capDate = capDate
        self.capCount = capCount
    }
}

public struct PersistentState: Codable, Equatable, Sendable {
    public var capDate: String = ""
    public var capCount: Int = 0
    public var panelFrame: String?
    enum CodingKeys: String, CodingKey {
        case capDate = "cap_date"; case capCount = "cap_count"; case panelFrame = "panel_frame"
    }
    public init() {}
}

public enum CapAdmission: Equatable, Sendable {
    case admitted(count: Int)
    case capDrop(count: Int)
}

public struct DailyCap: Sendable {
    public private(set) var state: DailyCapState
    private let limit: Int
    private var calendar: Calendar

    public init(limit: Int, state: DailyCapState = .init(), calendar: Calendar = .current) {
        self.limit = max(0, limit)
        self.state = state
        self.calendar = calendar
    }

    public mutating func admit(at date: Date) -> CapAdmission {
        let key = Self.dateKey(date, calendar: calendar)
        if state.capDate != key {
            state = DailyCapState(capDate: key, capCount: 0)
        }
        guard state.capCount < limit else { return .capDrop(count: state.capCount) }
        state.capCount += 1
        return .admitted(count: state.capCount)
    }

    private static func dateKey(_ date: Date, calendar: Calendar) -> String {
        let components = calendar.dateComponents([.year, .month, .day], from: date)
        return String(format: "%04d-%02d-%02d", components.year ?? 0, components.month ?? 0, components.day ?? 0)
    }
}
