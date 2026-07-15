import Foundation
import Testing
@testable import PremonitionApp

@Test("monitoring presentation maps status to native identity symbols and copy")
func monitoringPresentationMapsStatus() {
    #expect(MonitoringPresentation(status: .watching).stateTitle == Strings.watching)
    #expect(MonitoringPresentation(status: .watching).instruction == Strings.waitingForError)
    #expect(MonitoringPresentation(status: .watching).watchSymbol == "eye")

    #expect(MonitoringPresentation(status: .speculating).stateTitle == Strings.speculating)
    #expect(MonitoringPresentation(status: .speculating).instruction == Strings.draftingInstruction)
    #expect(MonitoringPresentation(status: .speculating).watchSymbol == "eye.fill")

    #expect(MonitoringPresentation(status: .paused).stateTitle == Strings.paused)
    #expect(MonitoringPresentation(status: .paused).instruction == Strings.pausedInstruction)
    #expect(MonitoringPresentation(status: .paused).watchSymbol == "eye.slash")
}

@Test("monitoring receipt keeps activity metadata quiet and accessible")
func monitoringReceiptPresentationKeepsMetadataContentFree() {
    let empty = MonitoringReceiptPresentation(
        lastRunStatus: Strings.noRunsYet,
        lastRunAt: nil,
        dailyCount: 1,
        dailyCap: 30
    )
    #expect(empty.activityTime == Strings.noRecentActivity)
    #expect(empty.dailyCountText == "1 / 30")
    #expect(empty.dailyAccessibilityLabel == "1 of 30 runs today")
    #expect(empty.receiptSymbol == "list.clipboard")

    #expect(MonitoringReceiptPresentation(lastRunStatus: Strings.applied,
                                          lastRunAt: .distantPast,
                                          dailyCount: 1,
                                          dailyCap: 30).receiptSymbol == "checkmark.circle")
    #expect(MonitoringReceiptPresentation(lastRunStatus: Strings.applyFailed,
                                          lastRunAt: .distantPast,
                                          dailyCount: 1,
                                          dailyCap: 30).receiptSymbol == "exclamationmark.triangle")
}

@Test("monitoring dial sweep travels the full ring and stays motion-safe")
func monitoringDialSweepTravelsTheFullRing() {
    let sweep = MonitoringDialSweep()
    let start = Date(timeIntervalSinceReferenceDate: 0)
    let quarter = Date(timeIntervalSinceReferenceDate: 1.05)
    let half = Date(timeIntervalSinceReferenceDate: 2.1)
    let threeQuarter = Date(timeIntervalSinceReferenceDate: 3.15)
    let halfTick = Int(sweep.activePosition(status: .watching, at: half).rounded())

    #expect(sweep.activePosition(status: .watching, at: start) == 0)
    #expect(sweep.activePosition(status: .watching, at: quarter) == 12)
    #expect(sweep.activePosition(status: .watching, at: half) == 24)
    #expect(sweep.activePosition(status: .watching, at: threeQuarter) == 36)
    #expect(sweep.opacity(for: 0, status: .paused, at: start) == 0.18)
    #expect(sweep.opacity(for: halfTick, status: .watching, at: half) > 0.18)
    #expect(sweep.opacity(for: 0, status: .watching, at: half) == 0.18)
}
