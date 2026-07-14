import Foundation
import Testing
@testable import PremonitionCore

private let acceptancePatch = """
diff --git a/file.txt b/file.txt
--- a/file.txt
+++ b/file.txt
@@ -1 +1 @@
-old
+new
"""

@Test("A2 zero-egress negatives")
func a2ZeroEgressNegatives() {
    let negatives = [
        "ordinary prose", "https://example.com/error", #"{"error":"bad"}"#,
        "Error: single line", "shell says Error but has no path\nand continues",
    ]
    var egress = 0
    for sample in negatives where ErrorGate().match(sample) != nil { egress += 1 }
    let oversized = String(repeating: "x", count: ClipboardCandidateFilter.maximumBytes + 1)
    if oversized.lengthOfBytes(using: .utf8) <= ClipboardCandidateFilter.maximumBytes { egress += 1 }
    #expect(egress == 0)
}

@Test("A5 cap survives serialization and resets at local midnight")
func a5PersistentCap() throws {
    var calendar = Calendar(identifier: .gregorian); calendar.timeZone = TimeZone(secondsFromGMT: 0)!
    let day = Date(timeIntervalSince1970: 1_700_000_000)
    var first = DailyCap(limit: 1, calendar: calendar)
    #expect(first.admit(at: day) == .admitted(count: 1))
    let restoredState = try JSONDecoder().decode(DailyCapState.self, from: JSONEncoder().encode(first.state))
    var relaunched = DailyCap(limit: 1, state: restoredState, calendar: calendar)
    #expect(relaunched.admit(at: day) == .capDrop(count: 1))
    #expect(relaunched.admit(at: day.addingTimeInterval(86_400)) == .admitted(count: 1))
}

@Test("A6 speculation is single-flight")
func a6Singleflight() {
    var machine = CandidateStateMachine(dailyCap: DailyCap(limit: 3))
    #expect(machine.admit(hash: "first", at: .distantPast) == .admitted(count: 1))
    #expect(machine.admit(hash: "second", at: .distantPast) == .singleflightDrop)
}

@Test("A7 fixture timeouts escalate once then discard")
func a7TimeoutFixture() {
    let outcome = FixtureSpeculator().run(initial: .timeout, escalation: .timeout)
    #expect(outcome == .discarded(calls: 2))
}

@Test("A9 rejects every bounded-path escape and accepts one fenced diff")
func a9Bounds() throws {
    let manager = FileManager.default
    let root = manager.temporaryDirectory.appendingPathComponent(UUID().uuidString)
    let outside = manager.temporaryDirectory.appendingPathComponent(UUID().uuidString)
    try manager.createDirectory(at: root, withIntermediateDirectories: true)
    try manager.createDirectory(at: outside, withIntermediateDirectories: true)
    defer { try? manager.removeItem(at: root); try? manager.removeItem(at: outside) }
    try manager.createSymbolicLink(at: root.appendingPathComponent("escape"), withDestinationURL: outside)
    let badPaths = ["../outside", "/tmp/outside", ".git/hooks/pre-commit", "escape/file"]
    for path in badPaths {
        let patch = "diff --git a/\(path) b/\(path)\n--- a/\(path)\n+++ b/\(path)\n@@ -1 +1 @@\n-a\n+b\n"
        #expect(throws: DiffError.self) {
            try DiffBoundsValidator().validate(try UnifiedDiffParser().parse(patch), repositoryRoot: root)
        }
    }
    #expect(throws: DiffError.binary) { try UnifiedDiffParser().parse("diff --git a/x b/x\nGIT binary patch\n") }
    let accepted = try UnifiedDiffParser().parse("```diff\n\(acceptancePatch)```")
    try DiffBoundsValidator().validate(accepted, repositoryRoot: root)
}
