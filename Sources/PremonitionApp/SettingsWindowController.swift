import AppKit
import SwiftUI

@MainActor
final class SettingsWindowController: NSWindowController {
    static let contentSize = NSSize(width: 520, height: 430)
    static let frameAutosaveName = "PremonitionSettingsWindow"

    convenience init(model: PresentationModel) {
        self.init(rootView: AnyView(SettingsPlaceholderView(model: model)))
    }

    init(rootView: AnyView) {
        let hostingController = NSHostingController(rootView: rootView)
        let window = NSWindow(contentViewController: hostingController)
        window.title = Strings.settingsTitle
        window.styleMask = [.titled, .closable, .miniaturizable]
        window.setContentSize(Self.contentSize)
        window.contentMinSize = Self.contentSize
        window.contentMaxSize = Self.contentSize
        window.isReleasedWhenClosed = false
        window.tabbingMode = .disallowed
        window.collectionBehavior = [.moveToActiveSpace]
        window.center()
        window.setFrameAutosaveName(Self.frameAutosaveName)
        super.init(window: window)
        shouldCascadeWindows = false
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func showSettings() {
        guard let window else { return }
        NSApp.activate(ignoringOtherApps: true)
        if window.isMiniaturized {
            window.deminiaturize(nil)
        }
        showWindow(nil)
        window.makeKeyAndOrderFront(nil)
    }
}
