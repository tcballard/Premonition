import AppKit

@MainActor
final class AppController: NSObject {
    private var statusItem: NSStatusItem?

    func start() {
        let item = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
        item.button?.image = NSImage(systemSymbolName: "eye.slash", accessibilityDescription: Strings.statusNotConfigured)
        item.button?.toolTip = Strings.statusNotConfigured

        let menu = NSMenu()
        let status = NSMenuItem(title: Strings.scaffoldStatus, action: nil, keyEquivalent: "")
        status.isEnabled = false
        menu.addItem(status)
        menu.addItem(.separator())
        menu.addItem(withTitle: Strings.quit, action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q")
        item.menu = menu
        statusItem = item
    }
}
