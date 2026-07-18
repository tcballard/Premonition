import AppKit
import Foundation
import PremonitionCore
import SwiftUI
import Testing
@testable import PremonitionApp

@Test("status item routes left click to popover and right click to native menu")
func statusItemInteractionUsesNativeClickSplit() {
    #expect(StatusItemInteraction.resolve(eventType: .leftMouseUp) == .togglePopover)
    #expect(StatusItemInteraction.resolve(eventType: .rightMouseUp) == .showContextMenu)
    #expect(StatusItemInteraction.resolve(eventType: nil) == .togglePopover)
}

@Test("status item menu anchors at the menu bar bottom edge")
func statusItemMenuAnchorsAtMenuBarBottomEdge() {
    let buttonFrame = NSRect(x: 120, y: 900, width: 28, height: 24)
    let visibleFrame = NSRect(x: 0, y: 40, width: 1_440, height: 852)
    let autoHiddenMenuBarFrame = NSRect(x: 0, y: 40, width: 1_440, height: 960)

    #expect(StatusItemMenuPosition.anchor(
        for: buttonFrame,
        screenVisibleFrame: visibleFrame
    ) == NSPoint(x: 120, y: 892))
    #expect(StatusItemMenuPosition.anchor(
        for: buttonFrame,
        screenVisibleFrame: autoHiddenMenuBarFrame
    ) == NSPoint(x: 120, y: 900))
}

@MainActor
@Test("status item native menu exposes settings config and quit")
func statusItemMenuExposesUtilityCommands() {
    let controller = AppController()
    let menu = controller.makeStatusMenu()

    #expect(menu.items.map(\.title) == [
        Strings.settings + "…",
        Strings.openConfig,
        "",
        Strings.quit,
    ])
    #expect(menu.items[0].target === controller)
    #expect(menu.items[1].target === controller)
    #expect(menu.items[2].isSeparatorItem)
    #expect(menu.items[3].target === controller)
}

@MainActor
@Test("settings controller owns one reusable fixed native window")
func settingsWindowControllerOwnsReusableWindow() throws {
    let controller = SettingsWindowController(rootView: AnyView(Text("Settings")))
    let window = try #require(controller.window)

    #expect(window.title == Strings.settingsTitle)
    #expect(window.styleMask.contains(.titled))
    #expect(window.styleMask.contains(.closable))
    #expect(window.styleMask.contains(.miniaturizable))
    #expect(!window.styleMask.contains(.resizable))
    #expect(window.contentMinSize == SettingsWindowController.contentSize)
    #expect(window.contentMaxSize == SettingsWindowController.contentSize)
    #expect(!window.isReleasedWhenClosed)

    controller.showSettings()
    #expect(window.isVisible)
    #expect(controller.window === window)

    window.close()
    #expect(controller.window === window)
}

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
    #expect(MonitoringReceiptPresentation(lastRunStatus: Strings.dismissed,
                                          lastRunAt: .distantPast,
                                          dailyCount: 1,
                                          dailyCap: 30).receiptSymbol == "xmark.circle")
}

@Test("held fix actions expose distinct terminal receipts")
func heldFixActionsExposeDistinctTerminalReceipts() {
    #expect(HeldFixTerminalAction.dismiss.receipt == "Dismissed")
    #expect(HeldFixTerminalAction.copyPatch.receipt == "Patch copied")
    #expect(HeldFixTerminalAction.apply.receipt == "Applied ✓")
}

@MainActor
@Test("pasteboard watcher ignores one handled local write and resumes external observation")
func pasteboardWatcherSuppressesOnlyHandledLocalWrite() {
    let pasteboard = NSPasteboard(name: .init("PremonitionTests.\(UUID().uuidString)"))
    let watcher = PasteboardWatcher(pasteboard: pasteboard)
    var observed: [String] = []
    watcher.onItem = { item in
        if let text = item.readPlainText() { observed.append(text) }
    }

    pasteboard.clearContents()
    pasteboard.setString("external one", forType: .string)
    watcher.poll()
    #expect(observed == ["external one"])

    pasteboard.clearContents()
    pasteboard.setString("local patch", forType: .string)
    watcher.markCurrentContentsAsHandled()
    watcher.poll()
    #expect(observed == ["external one"])

    pasteboard.clearContents()
    pasteboard.setString("external two", forType: .string)
    watcher.poll()
    #expect(observed == ["external one", "external two"])
}

@Test("fix-ready focus prefers Apply only while it is safe")
func fixReadyFocusUsesSafeInitialAction() {
    #expect(FixReadyAction.initial(applyEnabled: true) == .apply)
    #expect(FixReadyAction.initial(applyEnabled: false) == .copyPatch)
}

@MainActor
@Test("demo presentation is ordered content-free state with honest elapsed time")
func demoPresentationProjectsOrderedStages() {
    let presentation = DemoPresentation()
    let admitted = Date(timeIntervalSinceReferenceDate: 100)

    #expect(presentation.stage == .waiting)
    #expect(presentation.elapsed(at: admitted) == 0)

    presentation.begin(at: admitted)
    presentation.advance(to: .repositoryResolved)
    presentation.observe(.turnStarted)
    presentation.observe(.narration("content is deliberately ignored"))
    presentation.observe(.validating)
    presentation.complete()

    #expect(presentation.stage == .appliesCleanly)
    #expect(presentation.mode == .live)
    #expect(abs(presentation.elapsed(at: admitted.addingTimeInterval(7.8)) - 7.8) < 0.000_1)

    presentation.advance(to: .gatePassed)
    #expect(presentation.stage == .appliesCleanly)
    presentation.reset()
    #expect(presentation.stage == .waiting)
    #expect(presentation.admittedAt == nil)
}

@MainActor
@Test("demo panel is explicitly non-activating and reusable")
func demoPanelIsNonActivating() throws {
    let controller = DemoPanelController(presentation: DemoPresentation())
    let panel = try #require(controller.window as? NonActivatingDemoPanel)

    #expect(panel.styleMask.contains(.borderless))
    #expect(panel.styleMask.contains(.nonactivatingPanel))
    #expect(!panel.canBecomeKey)
    #expect(!panel.canBecomeMain)
    #expect(panel.level == .floating)
    #expect(panel.hasShadow)
    #expect(panel.isMovableByWindowBackground)

    controller.setVisible(true)
    #expect(panel.isVisible)
    #expect(!panel.isKeyWindow)
    controller.setVisible(false)
    #expect(!panel.isVisible)
}

@Test("demo panel persists geometry only through a bounded frame codec")
func demoPanelFrameCodecRoundTrips() throws {
    let frame = NSRect(x: 10, y: 20, width: 312, height: 148)
    let encoded = PanelFrameCodec.encode(frame)
    #expect(encoded == "10.0,20.0,312.0,148.0")
    #expect(PanelFrameCodec.decode(encoded) == frame)
    #expect(PanelFrameCodec.decode("not,a,frame") == nil)
    #expect(PanelFrameCodec.decode("1,2,-3,4") == nil)
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
