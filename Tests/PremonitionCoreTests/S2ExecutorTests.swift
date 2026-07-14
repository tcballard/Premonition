import Foundation
import Testing
@testable import PremonitionCore

private let jsonl = """
{"type":"thread.started","thread_id":"x"}
{"type":"turn.started"}
{"type":"future.event","value":1}
{"type":"item.completed","item":{"type":"agent_message","text":"diff --git a/a b/a"}}
{"type":"turn.completed","usage":{}}
"""

@Test("Codex JSONL requires completion, keeps the final message and tolerates unknown events")
func codexJSONLContract() throws {
    let result = try CodexJSONLParser().parse(jsonl)
    #expect(result.finalText == "diff --git a/a b/a")
    #expect(result.events.contains(.unknown("future.event")))
    #expect(throws: ExecutorError.incompleteTurn) {
        try CodexJSONLParser().parse(#"{"type":"item.completed","item":{"type":"agent_message","text":"x"}}"#)
    }
}

@Test("Codex invocation pins Sol, read-only, no-approval and ephemeral")
func codexInvocationContract() {
    let arguments = CodexExecutor.arguments(effort: .medium)
    #expect(arguments.prefix(3) == ["--ask-for-approval", "never", "exec"])
    #expect(arguments.contains("gpt-5.6-sol")); #expect(arguments.contains("read-only"))
    #expect(arguments.contains("--ephemeral")); #expect(arguments.contains("--ignore-user-config"))
    #expect(arguments.contains("model_reasoning_effort=\"medium\""))
    #expect(!arguments.contains("--skip-git-repo-check"))
}

@Test("rationale validation is bounded and rejects code-shaped output")
func rationaleContract() {
    #expect(RationaleValidator().validate("Changes the lookup key.\nKeeps existing behaviour.") != nil)
    #expect(RationaleValidator().validate("```swift\ncode\n```") == nil)
    #expect(RationaleValidator().validate(String(repeating: "x", count: 241)) == nil)
}

@Test("rationale prompt includes only the first ten error lines")
func rationalePromptBoundsErrorContext() throws {
    let error = (1...12).map { "line\($0)" }.joined(separator: "\n")
    let prompt = PromptBuilder().rationale(error: error, diff: try UnifiedDiffParser().parse(pipelinePatch))
    #expect(prompt.contains("line10")); #expect(!prompt.contains("line11"))
}

private actor ScriptedExecutor: Executor {
    private var results: [Result<String, Error>]
    private(set) var requests: [ExecutorRequest] = []
    init(_ results: [Result<String, Error>]) { self.results = results }
    func run(request: ExecutorRequest, onEvent: @escaping @Sendable (PipelineEvent) -> Void) async throws -> ExecutorResult {
        requests.append(request); onEvent(.started)
        return ExecutorResult(finalText: try results.removeFirst().get(), durationMilliseconds: 1)
    }
    func captured() -> [ExecutorRequest] { requests }
}

private let pipelinePatch = """
diff --git a/file.txt b/file.txt
--- a/file.txt
+++ b/file.txt
@@ -1 +1 @@
-old
+new
"""

@Test("initial validation failure escalates exactly once at Medium effort")
func pipelineEscalatesOnce() async throws {
    let root = FileManager.default.temporaryDirectory.appendingPathComponent(UUID().uuidString)
    try FileManager.default.createDirectory(at: root, withIntermediateDirectories: true)
    defer { try? FileManager.default.removeItem(at: root) }
    try Data("old\n".utf8).write(to: root.appendingPathComponent("file.txt"))
    _ = try await ProcessRunner().run(URL(fileURLWithPath: "/usr/bin/git"), arguments: ["init", "-q"], currentDirectory: root)
    let executor = ScriptedExecutor([.success("not a patch"), .success(pipelinePatch)])
    let outcome = await SpeculationPipeline(executor: executor).run(prompt: "error", repositoryRoot: root)
    guard case .fixReady(_, calls: 2) = outcome else { Issue.record("expected escalated fix"); return }
    let requests = await executor.captured()
    #expect(requests.map(\.effort) == [.low, .medium])
    #expect(requests.allSatisfy { $0.model == "gpt-5.6-sol" })
    #expect(try String(contentsOf: root.appendingPathComponent("file.txt"), encoding: .utf8) == "old\n")
}

@Test("escalated failure is terminal")
func pipelineTerminalFailure() async throws {
    let root = FileManager.default.temporaryDirectory.appendingPathComponent(UUID().uuidString)
    try FileManager.default.createDirectory(at: root, withIntermediateDirectories: true)
    defer { try? FileManager.default.removeItem(at: root) }
    let executor = ScriptedExecutor([.success("bad"), .success("still bad")])
    #expect(await SpeculationPipeline(executor: executor).run(prompt: "error", repositoryRoot: root) == .discarded(calls: 2))
    #expect(await executor.captured().count == 2)
}
