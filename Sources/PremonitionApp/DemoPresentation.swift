import Foundation
import Observation
import PremonitionCore

enum DemoRunMode: Equatable {
    case live
    case fixtureReplay(speed: Double)

    var label: String {
        switch self {
        case .live:
            Strings.liveRun
        case .fixtureReplay:
            Strings.fixtureReplay
        }
    }

    var detail: String? {
        guard case let .fixtureReplay(speed) = self else { return nil }
        return String(format: Strings.replaySpeedFormat, speed)
    }
}

enum DemoStage: Int, CaseIterable, Equatable {
    case waiting
    case gatePassed
    case repositoryResolved
    case solReadingFiles
    case solDraftingPatch
    case validating
    case appliesCleanly

    var label: String {
        switch self {
        case .waiting: Strings.demoWaiting
        case .gatePassed: Strings.gatePassed
        case .repositoryResolved: Strings.repositoryResolvedStage
        case .solReadingFiles: Strings.solReadingFiles
        case .solDraftingPatch: Strings.solDraftingPatch
        case .validating: Strings.validating
        case .appliesCleanly: Strings.appliesCleanly
        }
    }

    static func project(_ event: PipelineEvent) -> DemoStage? {
        switch event {
        case .started, .turnStarted:
            .solReadingFiles
        case .narration:
            .solDraftingPatch
        case .validating:
            .validating
        case .validated, .completed:
            nil
        case .unknown:
            nil
        }
    }
}

@MainActor @Observable
final class DemoPresentation {
    private(set) var stage: DemoStage = .waiting
    private(set) var mode: DemoRunMode = .live
    private(set) var admittedAt: Date?

    func begin(at date: Date = Date(), mode: DemoRunMode = .live) {
        admittedAt = date
        self.mode = mode
        stage = .gatePassed
    }

    func advance(to next: DemoStage) {
        guard admittedAt != nil, next.rawValue >= stage.rawValue else { return }
        stage = next
    }

    func observe(_ event: PipelineEvent) {
        if let projected = DemoStage.project(event) {
            advance(to: projected)
        }
    }

    func complete() {
        advance(to: .appliesCleanly)
    }

    func reset() {
        stage = .waiting
        mode = .live
        admittedAt = nil
    }

    func elapsed(at date: Date = Date()) -> TimeInterval {
        guard let admittedAt else { return 0 }
        return max(0, date.timeIntervalSince(admittedAt))
    }
}
