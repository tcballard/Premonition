import AppKit
import SwiftUI

@MainActor
final class AppController: NSObject {
    private var statusItem: NSStatusItem?
    private let popover = NSPopover()
    private let model = AppServices.presentation
    private var pulseTimer: Timer?
    private var pulseDimmed = false

    func start() {
        let item = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
        item.button?.target = self; item.button?.action = #selector(togglePopover)
        popover.behavior = .transient
        popover.contentViewController = NSHostingController(rootView: PopoverView(model: model))
        statusItem = item
        model.onStatusChange = { [weak self] in self?.refreshStatusItem() }
        refreshStatusItem()
        model.startWatching()
        if model.configuration.allowlistedRoots.isEmpty {
            DispatchQueue.main.async {
                NSApp.activate(ignoringOtherApps: true)
                NSApp.sendAction(Selector(("showSettingsWindow:")), to: nil, from: nil)
            }
        }
    }

    @objc private func togglePopover() {
        guard let button = statusItem?.button else { return }
        if popover.isShown {
            popover.performClose(nil)
        } else {
            refreshStatusItem()
            model.popoverPresented()
            popover.show(relativeTo: button.bounds, of: button, preferredEdge: .minY)
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
        return 196
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
