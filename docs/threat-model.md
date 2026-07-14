# Premonition v0.1 threat model

## Protected assets

- Clipboard contents, which may contain secrets.
- Source trees and Git metadata under allowlisted roots.
- User intent: no patch may modify files before explicit review and Apply.
- Local operational privacy: logs must not become a second content store.

## Trust boundaries and controls

Clipboard type metadata is trusted less than content. Concealed, transient and auto-generated items are rejected before the content accessor is called; non-text and oversized values never proceed. The deterministic gate is a conservative admission filter, not a claim that admitted text is safe.

Copied paths are untrusted. Resolution requires existing canonical paths inside explicit allowlisted roots. Diff paths are separately checked after parsing: absolute paths, traversal, `.git`, binary patches and symlink escapes are rejected. `git apply --check` adds Git's parser as a final non-mutating validation boundary.

Executor output is untrusted and may stall or be malformed. S1 exercises fixture replay and a subprocess runner with timeouts; only one escalation is permitted by the fixture state contract. A held or running candidate blocks all later candidates. The production Codex process and its precise cancellation/streaming contract are deferred to S2.

Configuration is validated back to safe defaults, including the pinned `gpt-5.6-sol` model. Daily cap state is date/count only. Verdict logging stores no clipboard text, diff, rationale or subprocess output.

## Residual risks

- Stack-trace pattern matching can admit false positives and miss unfamiliar formats.
- An allowlisted repository may itself contain hostile files; S2 must retain read-only execution and bounded context.
- Process termination semantics need verification against the real Codex process tree in S2 even though harmless subprocess timeout is covered in S1.
- Symlink targets can change between validation and a later Apply. The Apply implementation must revalidate immediately before mutation.
