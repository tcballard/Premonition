import AppKit
import SwiftUI

extension Notification.Name {
    static let premonitionPopoverBecameKey = Notification.Name("PremonitionPopoverBecameKey")
}

enum StatusItemInteraction: Equatable {
    case togglePopover
    case showContextMenu

    static func resolve(eventType: NSEvent.EventType?) -> Self {
        eventType == .rightMouseUp ? .showContextMenu : .togglePopover
    }
}

enum StatusItemMenuPosition {
    static func anchor(for buttonFrameInScreen: NSRect,
                       screenVisibleFrame: NSRect) -> NSPoint {
        NSPoint(
            x: buttonFrameInScreen.minX,
            y: min(buttonFrameInScreen.minY, screenVisibleFrame.maxY)
        )
    }
}

@MainActor
final class AppController: NSObject {
    private var statusItem: NSStatusItem?
    private let popover = NSPopover()
    private let model: PresentationModel
    private let settingsWindowController: SettingsWindowController
    private let demoPanelController: DemoPanelController
    private var pulseTimer: Timer?
    private var pulseDimmed = false

    override init() {
        let model = AppServices.presentation
        self.model = model
        settingsWindowController = SettingsWindowController(model: model)
        demoPanelController = DemoPanelController(presentation: model.demo)
        super.init()
    }

    func start() {
        let item = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
        item.button?.target = self
        item.button?.action = #selector(handleStatusItemClick(_:))
        item.button?.sendAction(on: [.leftMouseUp, .rightMouseUp])
        popover.behavior = .transient
        popover.contentViewController = NSHostingController(
            rootView: PopoverView(model: model) { [weak self] in
                self?.openSettings()
            }
        )
        statusItem = item
        model.onStatusChange = { [weak self] in self?.refreshStatusItem() }
        model.onDemoModeChange = { [weak self] visible in
            self?.demoPanelController.setVisible(visible)
        }
        demoPanelController.onFrameChange = { [weak model] frame in
            model?.saveDemoPanelFrame(frame)
        }
        demoPanelController.restoreFrame(model.demoPanelFrame)
        refreshStatusItem()
        demoPanelController.setVisible(model.configuration.surfaceMode == "demo")
        model.startWatching()
        if model.configuration.allowlistedRoots.isEmpty {
            DispatchQueue.main.async { [weak self] in
                self?.openSettings()
            }
        }
    }

    private func openSettings() {
        popover.performClose(nil)
        DispatchQueue.main.async { [weak self] in
            self?.settingsWindowController.showSettings()
        }
    }

    @objc private func handleStatusItemClick(_ sender: NSStatusBarButton) {
        switch StatusItemInteraction.resolve(eventType: NSApp.currentEvent?.type) {
        case .togglePopover:
            togglePopover()
        case .showContextMenu:
            if popover.isShown {
                popover.performClose(nil)
            }
            showStatusMenu(from: sender)
        }
    }

    private func showStatusMenu(from button: NSStatusBarButton) {
        guard let window = button.window,
              let screen = window.screen ?? NSScreen.main else { return }
        let frameInWindow = button.convert(button.bounds, to: nil)
        let frameInScreen = window.convertToScreen(frameInWindow)

        button.highlight(true)
        defer { button.highlight(false) }
        makeStatusMenu().popUp(
            positioning: nil,
            at: StatusItemMenuPosition.anchor(
                for: frameInScreen,
                screenVisibleFrame: screen.visibleFrame
            ),
            in: nil
        )
    }

    func makeStatusMenu() -> NSMenu {
        let menu = NSMenu()

        let settingsItem = NSMenuItem(
            title: Strings.settings + "…",
            action: #selector(openSettingsFromStatusMenu),
            keyEquivalent: ","
        )
        settingsItem.target = self
        menu.addItem(settingsItem)

        let openConfigItem = NSMenuItem(
            title: Strings.openConfig,
            action: #selector(openConfigFromStatusMenu),
            keyEquivalent: ""
        )
        openConfigItem.target = self
        openConfigItem.isEnabled = FileManager.default.fileExists(atPath: model.configurationURL.path)
        menu.addItem(openConfigItem)

        menu.addItem(.separator())

        let quitItem = NSMenuItem(
            title: Strings.quit,
            action: #selector(quitFromStatusMenu),
            keyEquivalent: "q"
        )
        quitItem.target = self
        menu.addItem(quitItem)

        return menu
    }

    @objc private func openSettingsFromStatusMenu() {
        openSettings()
    }

    @objc private func openConfigFromStatusMenu() {
        model.openConfigFile()
    }

    @objc private func quitFromStatusMenu() {
        model.quit()
    }

    @objc private func togglePopover() {
        guard let button = statusItem?.button else { return }
        if popover.isShown {
            popover.performClose(nil)
        } else {
            refreshStatusItem()
            model.popoverPresented()
            NSApp.activate(ignoringOtherApps: true)
            popover.show(relativeTo: button.bounds, of: button, preferredEdge: .minY)
            DispatchQueue.main.async { [weak self] in
                guard let window = self?.popover.contentViewController?.view.window else { return }
                window.makeKey()
                NotificationCenter.default.post(name: .premonitionPopoverBecameKey, object: window)
            }
        }
    }

    private func refreshStatusItem() {
        let (symbol, label): (String, String) = switch model.status {
        case .notConfigured: ("eye.slash", Strings.statusNotConfigured)
        case .watching: ("eye", Strings.watching)
        case .speculating: ("eye", Strings.speculating)
        case .fixReady: ("eye.fill", Strings.fixReady)
        case .paused: ("eye.slash", Strings.paused)
        }
        let configuration = NSImage.SymbolConfiguration(pointSize: 14, weight: .medium)
        statusItem?.button?.image = NSImage(systemSymbolName: symbol, accessibilityDescription: label)?
            .withSymbolConfiguration(configuration)
        statusItem?.button?.toolTip = label
        statusItem?.button?.contentTintColor = model.status == .fixReady ? .controlAccentColor : nil
        statusItem?.button?.setAccessibilityLabel(Strings.statusItem)
        statusItem?.button?.setAccessibilityValue(label)
        popover.contentSize = NSSize(width: 480, height: popoverHeight)
        configurePulse()
    }

    private var popoverHeight: CGFloat {
        if model.heldFix != nil { return 440 }
        if model.configuration.allowlistedRoots.isEmpty { return 260 }
        return 360
    }

    private func configurePulse() {
        pulseTimer?.invalidate(); pulseTimer = nil; pulseDimmed = false
        guard let button = statusItem?.button else { return }
        button.alphaValue = 1
        guard model.status == .speculating else { return }
        if NSWorkspace.shared.accessibilityDisplayShouldReduceMotion {
            button.alphaValue = 0.6
            return
        }
        pulseTimer = Timer.scheduledTimer(withTimeInterval: 0.6, repeats: true) { [weak self, weak button] _ in
            Task { @MainActor in
                guard let self, let button else { return }
                self.pulseDimmed.toggle()
                NSAnimationContext.runAnimationGroup { context in
                    context.duration = 0.6
                    context.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
                    button.animator().alphaValue = self.pulseDimmed ? 0.35 : 1
                }
            }
        }
    }
}
