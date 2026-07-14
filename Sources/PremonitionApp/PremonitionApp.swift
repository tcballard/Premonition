import SwiftUI

@main
struct PremonitionApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate

    var body: some Scene {
        Settings {
            SettingsPlaceholderView(model: AppServices.presentation)
        }
    }
}
