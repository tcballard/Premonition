import Foundation

public enum DiffLineKind: Equatable, Sendable { case added, removed, context, header }

public struct DiffLinePresentation: Equatable, Sendable {
    public let text: String
    public let kind: DiffLineKind
    public let accessibilityDescription: String
}

public struct DiffFilePresentation: Equatable, Sendable {
    public let path: String
    public let added: Int
    public let removed: Int
    public var changeSummary: String { "+\(added) −\(removed)" }
}

public struct DiffPresentation: Equatable, Sendable {
    public let lines: [DiffLinePresentation]
    public let files: [DiffFilePresentation]
    public let isSummarized: Bool
    public let added: Int
    public let removed: Int

    public var primaryFile: String? { files.first?.path }
    public var changeSummary: String { "+\(added) −\(removed)" }
    public var accessibleChangeSummary: String { "\(added) added, \(removed) removed" }

    public init(diff: UnifiedDiff, renderBudgetLines: Int) {
        let rawLines = diff.text.components(separatedBy: .newlines)
        lines = rawLines.map(Self.present)
        files = diff.files.map { file in
            let additions = file.lines.filter(Self.isAddition).count
            let removals = file.lines.filter(Self.isRemoval).count
            return DiffFilePresentation(path: Self.displayPath(file.newPath), added: additions, removed: removals)
        }
        added = files.reduce(0) { $0 + $1.added }
        removed = files.reduce(0) { $0 + $1.removed }
        isSummarized = rawLines.count > max(1, renderBudgetLines) || diff.files.count > 3
    }

    private static func present(_ text: String) -> DiffLinePresentation {
        let kind: DiffLineKind
        let label: String
        if isAddition(text) { kind = .added; label = "Added line: " + String(text.dropFirst()) }
        else if isRemoval(text) { kind = .removed; label = "Removed line: " + String(text.dropFirst()) }
        else if text.hasPrefix(" ") { kind = .context; label = "Context line: " + String(text.dropFirst()) }
        else { kind = .header; label = text }
        return DiffLinePresentation(text: text, kind: kind, accessibilityDescription: label)
    }

    private static func isAddition(_ line: String) -> Bool { line.hasPrefix("+") && !line.hasPrefix("+++") }
    private static func isRemoval(_ line: String) -> Bool { line.hasPrefix("-") && !line.hasPrefix("---") }
    private static func displayPath(_ path: String) -> String {
        path.hasPrefix("b/") ? String(path.dropFirst(2)) : path
    }
}
