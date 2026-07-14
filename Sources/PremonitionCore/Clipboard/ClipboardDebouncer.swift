import Foundation

public actor ClipboardDebouncer<Value: Sendable> {
    private let delay: Duration
    private var task: Task<Void, Never>?

    public init(delay: Duration = .seconds(2)) {
        self.delay = delay
    }

    public func submit(
        _ value: Value,
        deliver: @escaping @Sendable (Value) async -> Void
    ) {
        task?.cancel()
        task = Task {
            do {
                try await Task.sleep(for: delay)
                try Task.checkCancellation()
                await deliver(value)
            } catch {}
        }
    }

    public func cancel() {
        task?.cancel()
        task = nil
    }
}
