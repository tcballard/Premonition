# Premonition

**Copy an error, and the fix is already waiting.**

Premonition is a native macOS menu-bar app and ambient interface layer for
Codex. It watches the local clipboard for error-shaped text, resolves the
error only against Git repositories you explicitly allowlist, asks Codex
pinned to GPT-5.6 Sol for one bounded patch, validates that the patch applies,
and waits for your decision.

The v0.1 source, offline demo and signed, notarised judge artifact are complete
and owner-approved. This repository is public for judging; the signed archive
has not been published.

Owner-review explainer (ChatGPT sign-in required):
<https://premonition-field-guide.tom-ballard08574345.chatgpt.site>

## How the loop works

```text
clipboard → gate → allowlisted repository → admission → Sol → validation → review → human decision
```

1. Premonition polls the pasteboard locally twice per second. Concealed,
   transient and auto-generated items are skipped before their content is read.
2. A deterministic heuristic gate admits only supported, multi-line error
   shapes. Ordinary clipboard content stops locally.
3. Extracted paths must resolve to an existing Git repository beneath a root
   you added in Settings. Single-flight and the daily candidate cap are then
   checked.
4. Codex runs in an ephemeral, read-only, no-approval sandbox with the model
   pinned to `gpt-5.6-sol`.
5. One canonical parser rejects malformed, binary and out-of-repository diffs.
   `git apply --check` verifies mechanical applicability without changing the
   repository.
6. Premonition presents the diagnosis, semantic diff and optional Sol
   rationale. You choose **Apply**, **Copy Patch** or **Dismiss**.

Premonition never auto-applies, stages, commits, runs tests, invokes repository
hooks, or runs post-apply commands. Apply rechecks that the worktree is clean
and uses `git apply`; the resulting edit is unstaged.

## Privacy constitution

> Watches your clipboard locally. Nothing leaves this machine unless it is error-shaped text resolving to a Git repository you explicitly allowlist. If admitted, the copied error is sent verbatim to Codex using GPT-5.6 Sol. Premonition does not redact it, store it or auto-apply the result. You always review the patch first.

Copied errors are untrusted input and may contain secrets. v0.1 has no secret
redaction pass. After gate, allowlist and cap admission, the copied error is
sent verbatim to Codex. Premonition makes no claim about provider-side
retention.

An admitted candidate can make at most three model calls:

- one initial Sol patch attempt;
- one Sol escalation if execution or validation fails;
- one optional Sol rationale after a patch has validated.

Normal operation persists only configuration, date/count state and
content-free operational verdicts. It does not persist clipboard text,
prompts, diffs, rationales, model output or subprocess stderr.

## Requirements

- macOS 14 or later;
- Apple Silicon or a local Swift 5.10+ toolchain for source builds;
- an installed and authenticated Codex CLI for live speculation. The default
  path is `/opt/homebrew/bin/codex` and can be changed in the configuration;
- an explicitly allowlisted local Git repository.

Premonition has no third-party runtime dependencies.

## Build and run from source

The repository-owned developer entry point builds the app bundle and launches
it:

```bash
script/build_and_run.sh
```

For a launch verification without attaching a debugger:

```bash
script/build_and_run.sh --verify
```

The first launch opens Settings. Choose **Add Root…** and select a directory
containing repositories you permit Premonition to resolve. Settings shows the
Codex CLI status, the pinned GPT-5.6 Sol runtime, the daily count, and the
fixture-replay controls. No JSON editing is required for onboarding.

The local source-build bundle is not the signed judge artifact. A verified
signed archive is prepared, but no public download has been published.

## Offline demo mode

Create the deterministic demo repository:

```bash
scripts/make-demo-repo.sh /tmp/Premonition-Demo
```

Add `/tmp/Premonition-Demo` as an allowlisted root in Settings, enable the demo
panel, then choose **Replay Fixture**. Replay replaces only the model hop: the
real gate, repository resolver, admission, diff parser, bounds validator,
`git apply --check`, presentation and human decision still run. It requires no
network access and is visibly labelled **Fixture replay**.

For the live shallow failure, run `make break` inside that repository and copy
the traceback. `make break-deep` provides the deterministic cross-file failure.

## Safety and current limitations

- The error gate is heuristic. It can miss unfamiliar traces or admit false
  positives; it is not generic error comprehension.
- `git apply --check` proves only that a patch applies to the current tree. It
  does not prove that the patch is correct, secure or complete.
- Large patches are summarised rather than rendered without bound. **Copy
  Patch** remains available.
- Tracked or untracked worktree changes block Apply. The clean-tree and patch
  checks run again when Apply is clicked.
- One candidate may be active at a time; later candidates are dropped rather
  than queued. Ready fixes expire after ten minutes.
- Live Sol output can vary. Fixture replay is the deterministic evaluation
  route.
- v0.1 is macOS-only and has no telemetry, updater, clipboard history, secret
  redaction, IDE extension, model picker or automatic repository commands.

See [SECURITY.md](SECURITY.md) for the reporting path and the complete safety
boundary.

## Sol provenance and Build Week boundary

Sol has two explicit roles:

1. **Runtime engine:** every real v0.1 patch and rationale call is Codex pinned
   to GPT-5.6 Sol.
2. **Build partner:** the product decisions, architecture, implementation,
   tests, design reviews and release preparation were developed and reviewed
   in a durable GPT-5.6 Sol-selected Codex session, with the owner retaining
   final scope and acceptance decisions.

The evidence trail is in [PREMONITION_SPEC.md](PREMONITION_SPEC.md),
[BUILDLOG.md](BUILDLOG.md), [DEVLOG.md](DEVLOG.md), and
[docs/build-week/sol-ledger.md](docs/build-week/sol-ledger.md).

The boundary is dated and explicit: specification v1.1 planning predates the
Submission Period on 12 July 2026; Sol-assisted specification and workflow
planning is recorded through [commit `2e83e84`](https://github.com/tcballard/Premonition/commit/2e83e846d9bbe8764dce82a2e0869ce5655ea24c)
on 13 July; new application implementation begins with [S0 commit `3422b0c`](https://github.com/tcballard/Premonition/commit/3422b0c4100f3ea156eab11fd91f9a251f2f9cac)
on 14 July. See
[docs/build-week/prior-new-boundary.md](docs/build-week/prior-new-boundary.md).

## Roadmap

Bi-directional MCP integration and a direct OpenAI API executor are roadmap
items. They are not present in v0.1. CodexToolkit skills used during the build
are external workflow infrastructure, not shipped app or runtime dependencies.

## Licence

Premonition is available under the [MIT Licence](LICENSE).
