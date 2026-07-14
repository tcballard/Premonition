import AppKit

final class AppDelegate: NSObject, NSApplicationDelegate {
    private var appController: AppController?

    func applicationDidFinishLaunching(_ notification: Notification) {
        let controller = AppController()
        appController = controller
        controller.start()
    }
}
