import Foundation

public enum ErrorLanguage: String, CaseIterable, Sendable {
    case python
    case javaScript
    case rust
    case javaOrKotlin
    case go
    case generic
}

public struct GateMatch: Equatable, Sendable {
    public let language: ErrorLanguage
    public let extractedPaths: [String]

    public init(language: ErrorLanguage, extractedPaths: [String]) {
        self.language = language
        self.extractedPaths = extractedPaths
    }
}

public struct ErrorGate: Sendable {
    private struct Signature: Sendable {
        let language: ErrorLanguage
        let patterns: [String]
    }

    private static let signatures: [Signature] = [
        .init(language: .python, patterns: [#"Traceback \(most recent call last\):"#, #"File \"[^\"]+\", line \d+"#]),
        .init(language: .javaScript, patterns: [#"(?m)^\s*at .+\.(?:js|ts|jsx|tsx|mjs|cjs):\d+:\d+"#, #"(?s)Error:.*\n\s*at "#]),
        .init(language: .rust, patterns: [#"thread '[^']+' panicked at"#]),
        .init(language: .javaOrKotlin, patterns: [#"(?m)^\s*at .+\.(?:java|kt):\d+"#]),
        .init(language: .go, patterns: [#"goroutine \d+ \["#]),
        .init(language: .generic, patterns: [#"(?s)(?:Exception|Error).*[/\\][^\s:]+"#]),
    ]

    private static let pathPattern = #"(?:~|/|\.{0,2}/)?(?:[A-Za-z0-9_.-]+[/\\])+[A-Za-z0-9_.-]+(?:\.(?:py|js|ts|jsx|tsx|mjs|cjs|rs|java|kt|go|swift))?"#

    public init() {}

    public func match(_ text: String) -> GateMatch? {
        guard text.contains("\n") else { return nil }
        for signature in Self.signatures where signature.patterns.contains(where: { matches($0, text) }) {
            return GateMatch(language: signature.language, extractedPaths: extractPaths(text))
        }
        return nil
    }

    private func extractPaths(_ text: String) -> [String] {
        guard let regex = try? NSRegularExpression(pattern: Self.pathPattern) else { return [] }
        let range = NSRange(text.startIndex..., in: text)
        var seen = Set<String>()
        return regex.matches(in: text, range: range).compactMap { match in
            guard let range = Range(match.range, in: text) else { return nil }
            let path = String(text[range]).trimmingCharacters(in: CharacterSet(charactersIn: "\"'(),"))
            return seen.insert(path).inserted ? path : nil
        }
    }

    private func matches(_ pattern: String, _ text: String) -> Bool {
        guard let regex = try? NSRegularExpression(pattern: pattern) else { return false }
        return regex.firstMatch(in: text, range: NSRange(text.startIndex..., in: text)) != nil
    }
}
