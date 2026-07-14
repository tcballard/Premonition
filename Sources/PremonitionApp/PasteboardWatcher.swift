import AppKit
import PremonitionCore

final class AppKitPasteboardItem: PasteboardItem {
    private let item: NSPasteboardItem
    init(_ item: NSPasteboardItem) { self.item = item }
    var declaredTypes: Set<PasteboardType> {
        Set(item.types.compactMap { PasteboardType(rawValue: $0.rawValue) })
    }
    func readPlainText() -> String? { item.string(forType: .string) }
}

@MainActor
final class PasteboardWatcher {
    private let pasteboard: NSPasteboard
    private var timer: Timer?
    private var changeCount: Int
    var onItem: ((PasteboardItem) -> Void)?

    init(pasteboard: NSPasteboard = .general) {
        self.pasteboard = pasteboard; changeCount = pasteboard.changeCount
    }
    func start() {
        guard timer == nil else { return }
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { [weak self] _ in
            MainActor.assumeIsolated { self?.poll() }
        }
    }
    func stop() { timer?.invalidate(); timer = nil }
    private func poll() {
        guard pasteboard.changeCount != changeCount else { return }
        changeCount = pasteboard.changeCount
        guard let item = pasteboard.pasteboardItems?.first else { return }
        onItem?(AppKitPasteboardItem(item))
    }
}
