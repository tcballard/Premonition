import AppKit
import SwiftUI

@MainActor
final class AppController: NSObject {
    private var statusItem: NSStatusItem?
    private let popover = NSPopover()
    private let model = AppServices.presentation

    func start() {
        let item = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
        item.button?.target = self; item.button?.action = #selector(togglePopover)
        popover.behavior = .transient
        popover.contentSize = NSSize(width: 480, height: 220)
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
        statusItem?.button?.image = NSImage(systemSymbolName: symbol, accessibilityDescription: label)
        statusItem?.button?.toolTip = label
        statusItem?.button?.contentTintColor = model.status == .fixReady ? .controlAccentColor : nil
    }
}
