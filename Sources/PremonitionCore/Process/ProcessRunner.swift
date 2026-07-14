import Darwin
import Foundation

public struct ProcessResult: Equatable, Sendable {
    public let status: Int32
    public let stdout: String
    public let stderr: String
}

public enum ProcessRunnerError: Error, Equatable, Sendable { case timedOut, launch(String) }

private final class ProcessCapture: @unchecked Sendable {
    private let lock = NSLock()
    private var output = Data(), errors = Data(), pending = Data()
    private let onLine: (@Sendable (String) -> Void)?

    init(onLine: (@Sendable (String) -> Void)?) { self.onLine = onLine }

    func appendOutput(_ data: Data) {
        lock.lock(); defer { lock.unlock() }
        output.append(data); pending.append(data)
        while let newline = pending.firstIndex(of: 0x0A) {
            let line = pending[..<newline]
            pending.removeSubrange(...newline)
            onLine?(String(decoding: line, as: UTF8.self))
        }
    }

    func appendError(_ data: Data) {
        lock.lock(); defer { lock.unlock() }
        let remaining = max(0, 64 * 1_024 - errors.count)
        errors.append(data.prefix(remaining))
    }

    func result(status: Int32) -> ProcessResult {
        lock.lock(); defer { lock.unlock() }
        if !pending.isEmpty { onLine?(String(decoding: pending, as: UTF8.self)); pending.removeAll() }
        return ProcessResult(status: status, stdout: String(decoding: output, as: UTF8.self),
                             stderr: String(decoding: errors, as: UTF8.self))
    }
}

private final class ProcessTermination: @unchecked Sendable {
    private let lock = NSLock()
    private var completed = false
    private var continuation: CheckedContinuation<Void, Never>?

    func signal() {
        lock.lock(); completed = true; let value = continuation; continuation = nil; lock.unlock()
        value?.resume()
    }
    func wait() async {
        await withCheckedContinuation { value in
            lock.lock()
            if completed { lock.unlock(); value.resume() }
            else { continuation = value; lock.unlock() }
        }
    }
}

public struct ProcessRunner: Sendable {
    public init() {}

    public func run(
        _ executable: URL,
        arguments: [String] = [],
        currentDirectory: URL? = nil,
        environment: [String: String]? = nil,
        stdin: Data? = nil,
        timeout: Duration = .seconds(30),
        onStdoutLine: (@Sendable (String) -> Void)? = nil
    ) async throws -> ProcessResult {
        let process = Process()
        let output = Pipe(), errors = Pipe(), input = Pipe()
        let capture = ProcessCapture(onLine: onStdoutLine)
        let termination = ProcessTermination()
        process.executableURL = executable
        process.arguments = arguments
        process.currentDirectoryURL = currentDirectory
        process.standardOutput = output
        process.standardError = errors
        process.standardInput = input
        process.terminationHandler = { _ in termination.signal() }
        output.fileHandleForReading.readabilityHandler = { handle in
            let data = handle.availableData
            if data.isEmpty { handle.readabilityHandler = nil } else { capture.appendOutput(data) }
        }
        errors.fileHandleForReading.readabilityHandler = { handle in
            let data = handle.availableData
            if data.isEmpty { handle.readabilityHandler = nil } else { capture.appendError(data) }
        }
        var processEnvironment = environment ?? ProcessInfo.processInfo.environment
        let prefix = "/opt/homebrew/bin:/usr/local/bin"
        processEnvironment["PATH"] = prefix + ":" + (processEnvironment["PATH"] ?? "/usr/bin:/bin")
        process.environment = processEnvironment
        do { try process.run() } catch { throw ProcessRunnerError.launch(error.localizedDescription) }
        if let stdin { input.fileHandleForWriting.write(stdin) }
        try? input.fileHandleForWriting.close()

        return try await withTaskCancellationHandler {
            try await withThrowingTaskGroup(of: ProcessResult.self) { group in
                group.addTask {
                    await termination.wait()
                    try? await Task.sleep(for: .milliseconds(20))
                    output.fileHandleForReading.readabilityHandler = nil
                    errors.fileHandleForReading.readabilityHandler = nil
                    return capture.result(status: process.terminationStatus)
                }
                group.addTask {
                    try await Task.sleep(for: timeout)
                    if process.isRunning {
                        terminateWithGrace(process)
                    }
                    throw ProcessRunnerError.timedOut
                }
                defer { group.cancelAll() }
                guard let result = try await group.next() else { throw CancellationError() }
                try Task.checkCancellation()
                return result
            }
        } onCancel: {
            if process.isRunning { terminateWithGrace(process) }
        }
    }

    private func terminateWithGrace(_ process: Process) {
        let identifier = process.processIdentifier
        process.terminate()
        DispatchQueue.global().asyncAfter(deadline: .now() + .milliseconds(250)) {
            if process.isRunning { kill(identifier, SIGKILL) }
        }
    }
}

public struct GitApplyChecker: Sendable {
    private let runner = ProcessRunner()
    public init() {}

    public func check(_ diff: UnifiedDiff, repositoryRoot: URL, timeout: Duration = .seconds(10)) async throws {
        let result = try await runner.run(URL(fileURLWithPath: "/usr/bin/git"), arguments: ["apply", "--check", "-"],
                                          currentDirectory: repositoryRoot, stdin: Data(diff.text.utf8), timeout: timeout)
        guard result.status == 0 else { throw DiffError.checkFailed(result.stderr) }
    }
}
