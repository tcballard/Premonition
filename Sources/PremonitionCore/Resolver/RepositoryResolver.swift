import Foundation

public struct RepositoryResolution: Equatable, Sendable {
    public let root: URL
    public let matchedPathCount: Int
}

public struct RepositoryResolver: @unchecked Sendable {
    private let fileManager: FileManager

    public init(fileManager: FileManager = .default) {
        self.fileManager = fileManager
    }

    public func resolve(paths: [String], allowlistedRoots: [URL]) -> RepositoryResolution? {
        let roots = allowlistedRoots.compactMap(canonicalExistingURL).sorted { $0.path < $1.path }
        var scores: [URL: Int] = [:]

        for rawPath in paths {
            let expanded = NSString(string: rawPath).expandingTildeInPath
            let candidates = expanded.hasPrefix("/") ? [URL(fileURLWithPath: expanded)]
                : roots.map { $0.appendingPathComponent(expanded) }
            for candidate in candidates {
                guard let realPath = canonicalExistingURL(candidate) else { continue }
                for allowedRoot in roots where contains(realPath, in: allowedRoot) {
                    guard let repository = nearestRepository(from: realPath), contains(repository, in: allowedRoot) else { continue }
                    scores[repository, default: 0] += 1
                    break
                }
                break
            }
        }

        return scores
            .map { RepositoryResolution(root: $0.key, matchedPathCount: $0.value) }
            .sorted {
                if $0.matchedPathCount != $1.matchedPathCount { return $0.matchedPathCount > $1.matchedPathCount }
                return $0.root.path < $1.root.path
            }
            .first
    }

    private func canonicalExistingURL(_ url: URL) -> URL? {
        let standardized = url.standardizedFileURL.resolvingSymlinksInPath()
        guard fileManager.fileExists(atPath: standardized.path) else { return nil }
        return standardized
    }

    private func contains(_ candidate: URL, in root: URL) -> Bool {
        candidate.path == root.path || candidate.path.hasPrefix(root.path + "/")
    }

    private func nearestRepository(from path: URL) -> URL? {
        var current = path
        var isDirectory: ObjCBool = false
        if fileManager.fileExists(atPath: current.path, isDirectory: &isDirectory), !isDirectory.boolValue {
            current.deleteLastPathComponent()
        }
        while current.path != "/" {
            if fileManager.fileExists(atPath: current.appendingPathComponent(".git").path) {
                return current
            }
            current.deleteLastPathComponent()
        }
        return nil
    }
}
