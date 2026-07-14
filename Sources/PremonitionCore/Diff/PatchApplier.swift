import Foundation

public enum PatchApplyError: Error, Equatable, Sendable { case dirtyTree, applyFailed(String) }

public struct PatchApplier: Sendable {
    private let runner = ProcessRunner()
    public init() {}

    public func isClean(repositoryRoot: URL) async throws -> Bool {
        let result = try await runner.run(URL(fileURLWithPath: "/usr/bin/git"),
                                          arguments: ["status", "--porcelain"], currentDirectory: repositoryRoot)
        return result.status == 0 && result.stdout.isEmpty
    }

    public func apply(_ diff: UnifiedDiff, repositoryRoot: URL) async throws {
        guard try await isClean(repositoryRoot: repositoryRoot) else { throw PatchApplyError.dirtyTree }
        try DiffBoundsValidator().validate(diff, repositoryRoot: repositoryRoot)
        try await GitApplyChecker().check(diff, repositoryRoot: repositoryRoot)
        let result = try await runner.run(URL(fileURLWithPath: "/usr/bin/git"), arguments: ["apply", "-"],
                                          currentDirectory: repositoryRoot, stdin: Data(diff.text.utf8))
        guard result.status == 0 else { throw PatchApplyError.applyFailed(result.stderr) }
    }
}
