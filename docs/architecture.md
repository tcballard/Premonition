# Premonition v0.1 architecture

Premonition's safety core is a sequence of explicit admission boundaries. Clipboard metadata is inspected before content is read. Eligible plain text is size-checked and deduplicated, then a deterministic error-shape gate extracts conservative path evidence. The repository resolver canonicalises existing paths, follows symlinks and admits only the nearest Git repository contained by an owner-allowlisted root.

One candidate may occupy the state machine at a time, including while a validated fix is held for review. Daily-cap admission happens only after the single-flight check and persists as a date/count pair. The S1 `FixtureExecutor` replays local recorded events; it cannot invoke Codex or cause network egress. The production Codex executor remains S2 work.

Model output crosses one canonical diff parser. The parser permits exactly one surrounding Markdown fence, rejects malformed or binary patches and produces the representation used for bounds checks and later rendering/apply work. Bounds checks reject absolute paths, traversal, `.git` metadata and symlink escapes. Validation sends that same diff to `git apply --check` through standard input; it never mutates the worktree. Explicit Apply is intentionally outside S1.

`ProcessRunner` owns subprocess input, captured output and configured timeout termination. Verdict records contain timestamps, short candidate hashes, decisions and bounded operational metadata, never clipboard text, model output or patch content.

## Phase boundary

S1 is headless and deterministic. It contains no pasteboard watcher, production Codex invocation, app UI, patch application, telemetry or content persistence.
