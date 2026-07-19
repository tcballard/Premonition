# Premonition v0.1 architecture

Premonition is a native macOS 14+ `LSUIElement` menu-bar application with a
SwiftUI presentation layer, narrow AppKit ownership for the status item,
popover, settings window and demo panel, and a dependency-free
`PremonitionCore` package for safety-critical behaviour.

Its pipeline is deliberately linear:

```text
gate → resolve → admit → speculate → validate → present → human decision
```

## Application ownership

`AppDelegate` creates one long-lived `AppController`. The controller owns the
status item, transient popover, reusable Settings `NSWindowController` and
non-activating demo `NSPanel`. `PresentationModel` is the single UI state
source and owns pasteboard observation, candidate tasks, expiry, persistence
and transitions into the core pipeline.

The left click opens the popover; the right click opens a native utility menu
anchored beneath the menu bar. First launch opens Settings once when no roots
exist. The app remains an accessory application and has no Dock icon.

## Admission and egress

`PasteboardWatcher` polls `NSPasteboard.changeCount` every 0.5 seconds. Declared
types are inspected before text access. Concealed, transient and auto-generated
items are skipped unread; accepted plain text is limited to 32 KiB, hashed in
memory, deduplicated for ten minutes and debounced for two seconds.

`ErrorGate` is deterministic and model-free. Its extracted path evidence passes
to `RepositoryResolver`, which canonicalises paths and allows only existing Git
repositories beneath explicit owner roots. `CandidateStateMachine` then checks
single-flight before consuming the persistent daily-cap slot. No model call is
possible before all three boundaries pass.

`CodexExecutor` is the only live executor. It pins `gpt-5.6-sol` and starts the
Codex CLI with JSONL output, read-only sandbox, no approval, ephemeral mode and
ignored user configuration. Initial speculation uses Low effort. Any execution
or validation failure permits exactly one Medium-effort escalation. A validated
fix may make one optional Low-effort rationale call. Candidate release cancels
that rationale task.

`FixtureReplayExecutor` replaces only the model hop. It replays local events and
the recorded diff while the live gate, resolver, admission, validation,
presentation and human decision remain active. Fixture replay produces no model
egress.

## Validation and mutation

Model and fixture output enter one `UnifiedDiffParser`. It accepts at most one
surrounding Markdown fence and rejects empty, malformed and binary output.
`DiffBoundsValidator` rejects absolute paths, traversal, `.git` targets and
symlink escapes beneath the resolved repository. `GitApplyChecker` supplies the
same in-memory patch to `git apply --check` on standard input; no file changes
occur.

The ready fix remains in memory for ten minutes and is never opened
automatically. The UI renders a bounded semantic projection, summarising over
120 rendered lines or three files. A Sol rationale is optional prose, not proof.

Apply is the only product mutation. `PatchApplier` checks that
`git status --porcelain` is literally empty, repeats bounds validation and
`git apply --check`, then supplies the patch to `git apply`. The result is an
unstaged working-tree edit. There is no staging, commit, test, linter, hook or
post-apply command. Copy Patch writes the held diff to the pasteboard and marks
that local write handled; Dismiss and expiry mutate no repository state.

## Persistence

Normal operation creates at most three owner-only JSON surfaces beneath
`~/Library/Application Support/Premonition`:

- `config.json`: allowlisted roots and bounded operational settings;
- `state.json`: daily cap date/count and demo-panel geometry;
- `verdicts.jsonl`: timestamp, short candidate hash, verdict and bounded
  operational metadata.

Clipboard text, prompts, diffs, rationales, model output and stderr are never
written in normal operation. DEBUG-only fixture recording is the sole specified
content-persistence exception and requires explicit activation.

## Accessibility and motion

The eye SF Symbol family communicates state with text and accessibility values,
not colour alone. Controls preserve native keyboard focus; Apply is the Return
default only when safe, Copy Patch becomes the initial action when Apply is
blocked, and Apply failures are announced. The monitoring sweep and status-item
pulse honour Reduce Motion. Semantic diff lines expose added/removed/context
labels in addition to restrained system colours.

## Distribution boundary

SwiftPM and repository-owned bundle scripts are canonical. The release bundle
has no third-party runtime dependencies. Signing, notarisation, stapling and
Homebrew publication are distribution steps outside runtime and remain
owner-gated. No telemetry, updater, MCP server, direct API executor or shipped
Codex skill/plugin exists in v0.1.
