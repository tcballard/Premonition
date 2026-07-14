import Foundation

public struct DiffFile: Equatable, Sendable {
    public let oldPath: String
    public let newPath: String
    public let lines: [String]
}

public struct UnifiedDiff: Equatable, Sendable {
    public let text: String
    public let files: [DiffFile]
}

public enum DiffError: Error, Equatable, Sendable {
    case empty, malformed, binary, unsafePath(String), symlinkEscape(String), checkFailed(String)
}

public struct UnifiedDiffParser: Sendable {
    public init() {}

    public func parse(_ output: String) throws -> UnifiedDiff {
        let text = stripOneFence(output).trimmingCharacters(in: .whitespacesAndNewlines)
        guard !text.isEmpty else { throw DiffError.empty }
        guard !text.contains("GIT binary patch"), !text.contains("Binary files ") else { throw DiffError.binary }
        let lines = text.components(separatedBy: .newlines)
        var files: [DiffFile] = []
        var index = 0
        while index < lines.count {
            guard lines[index].hasPrefix("diff --git ") else { throw DiffError.malformed }
            let start = index
            index += 1
            while index < lines.count, !lines[index].hasPrefix("--- ") { index += 1 }
            guard index + 1 < lines.count, lines[index].hasPrefix("--- "), lines[index + 1].hasPrefix("+++ ") else {
                throw DiffError.malformed
            }
            let oldPath = headerPath(lines[index], prefix: "--- ")
            let newPath = headerPath(lines[index + 1], prefix: "+++ ")
            index += 2
            guard index < lines.count, lines[index].hasPrefix("@@ ") else { throw DiffError.malformed }
            while index < lines.count, !lines[index].hasPrefix("diff --git ") { index += 1 }
            files.append(DiffFile(oldPath: oldPath, newPath: newPath, lines: Array(lines[start..<index])))
        }
        guard !files.isEmpty else { throw DiffError.malformed }
        return UnifiedDiff(text: text + "\n", files: files)
    }

    private func stripOneFence(_ value: String) -> String {
        let trimmed = value.trimmingCharacters(in: .whitespacesAndNewlines)
        guard trimmed.hasPrefix("```"), trimmed.hasSuffix("```"),
              let firstNewline = trimmed.firstIndex(of: "\n") else { return value }
        let bodyStart = trimmed.index(after: firstNewline)
        let bodyEnd = trimmed.index(trimmed.endIndex, offsetBy: -3)
        guard bodyStart <= bodyEnd else { return value }
        return String(trimmed[bodyStart..<bodyEnd])
    }

    private func headerPath(_ line: String, prefix: String) -> String {
        String(line.dropFirst(prefix.count)).split(separator: "\t", maxSplits: 1).first.map(String.init) ?? ""
    }
}

public struct DiffBoundsValidator: Sendable {
    public init() {}

    public func validate(_ diff: UnifiedDiff, repositoryRoot: URL) throws {
        let root = repositoryRoot.standardizedFileURL.resolvingSymlinksInPath()
        for file in diff.files {
            if file.oldPath == "/dev/null" { try validate(path: file.newPath, root: root) }
            else if file.newPath == "/dev/null" { try validate(path: file.oldPath, root: root) }
            else {
                try validate(path: file.oldPath, root: root)
                try validate(path: file.newPath, root: root)
            }
        }
    }

    private func validate(path raw: String, root: URL) throws {
        let path = raw.hasPrefix("a/") || raw.hasPrefix("b/") ? String(raw.dropFirst(2)) : raw
        guard !path.isEmpty, !path.hasPrefix("/"), !path.split(separator: "/").contains(".."),
              path != ".git", !path.hasPrefix(".git/") else { throw DiffError.unsafePath(raw) }
        var cursor = root
        for component in path.split(separator: "/") {
            cursor.appendPathComponent(String(component))
            let resolved = cursor.standardizedFileURL.resolvingSymlinksInPath()
            guard resolved.path == root.path || resolved.path.hasPrefix(root.path + "/") else {
                throw DiffError.symlinkEscape(raw)
            }
            cursor = resolved
        }
    }
}
