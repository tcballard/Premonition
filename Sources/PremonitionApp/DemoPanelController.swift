import AppKit
import SwiftUI

enum PanelFrameCodec {
    static func encode(_ frame: NSRect) -> String {
        [frame.origin.x, frame.origin.y, frame.size.width, frame.size.height]
            .map { String(format: "%.1f", $0) }
            .joined(separator: ",")
    }

    static func decode(_ value: String?) -> NSRect? {
        guard let value else { return nil }
        let parts = value.split(separator: ",")
        guard parts.count == 4 else { return nil }
        let components = parts.compactMap { Double($0) }
        guard components.count == 4, components[2] > 0, components[3] > 0 else { return nil }
        return NSRect(x: components[0], y: components[1],
                      width: components[2], height: components[3])
    }
}

final class NonActivatingDemoPanel: NSPanel {
    override var canBecomeKey: Bool { false }
    override var canBecomeMain: Bool { false }
}

@MainActor
final class DemoPanelController: NSWindowController, NSWindowDelegate {
    static let contentSize = NSSize(width: 312, height: 148)
    var onFrameChange: ((NSRect) -> Void)?

    init(presentation: DemoPresentation) {
        let hostingController = NSHostingController(
            rootView: DemoPanelView(presentation: presentation)
        )
        let panel = NonActivatingDemoPanel(
            contentRect: NSRect(origin: .zero, size: Self.contentSize),
            styleMask: [.borderless, .nonactivatingPanel],
            backing: .buffered,
            defer: false
        )
        panel.contentViewController = hostingController
        panel.level = .floating
        panel.hasShadow = true
        panel.isOpaque = false
        panel.backgroundColor = .clear
        panel.isMovableByWindowBackground = true
        panel.hidesOnDeactivate = false
        panel.collectionBehavior = [.canJoinAllSpaces, .fullScreenAuxiliary]
        panel.setContentSize(Self.contentSize)
        panel.center()
        super.init(window: panel)
        panel.delegate = self
        shouldCascadeWindows = false
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setVisible(_ visible: Bool) {
        guard let window else { return }
        if visible {
            window.orderFrontRegardless()
        } else {
            window.orderOut(nil)
        }
    }

    func restoreFrame(_ frame: NSRect?) {
        guard let frame, let window else { return }
        window.setFrame(frame, display: false)
    }

    func windowDidMove(_ notification: Notification) {
        guard let frame = window?.frame else { return }
        onFrameChange?(frame)
    }
}
