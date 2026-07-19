# Premonition v0.1 threat model

## Protected assets

- Clipboard contents, which may contain credentials, source code or personal
  data.
- Source trees and Git metadata beneath allowlisted roots.
- User intent: no repository mutation before explicit review and Apply.
- Local operational privacy: normal logs and state must not become a second
  content store.
- Release integrity: a distributed app must be signed, notarised, stapled and
  independently verified before it is represented as the judge artifact.

## Trust boundaries and controls

### Clipboard and prompt injection

Pasteboard declarations and text are untrusted. Privacy-marker types are
rejected before content reads; other text is size-limited, deduplicated and
debounced. `ErrorGate` is local and deterministic. Its prompt-injection-shaped
negative fixtures must produce zero executor starts and zero egress.

The gate is not a secret detector. If error-shaped text resolves to an
allowlisted repository and passes admission, it is sent verbatim. The runtime
prompt labels error text as untrusted data and tells Sol not to follow embedded
instructions, but prompt wording is defence in depth rather than a guarantee.

### Repository resolution and hostile content

Copied paths and repository files are untrusted. Candidate paths must exist,
canonicalise beneath an explicit allowlisted root and resolve to the nearest Git
repository. Symlinks targeting outside the root do not resolve.

The Codex process runs with the repository as its working directory but is
explicitly read-only, no-approval and ephemeral. `--ignore-user-config` narrows
ambient behaviour. A hostile repository may still influence model output or
consume bounded time; the resulting diff receives independent local validation.

### Admission, concurrency and model egress

Gate and repository resolution precede single-flight and cap admission. Only
one running or held candidate is permitted. The default cap is 30 admitted
candidates per local day, not 30 subprocess calls. One candidate can make at
most an initial patch call, one escalation and one post-validation rationale.

Timeout and cancellation terminate the child process. Pause cancels debounce,
speculation and rationale work. Dismiss, Copy Patch, Apply and expiry cancel an
unfinished rationale and release the slot, preventing post-decision egress from
an abandoned candidate.

### Model output, diff paths and Apply

JSONL and final model text are untrusted and held only in memory. The executor
requires successful turn completion and a final assistant message. Stderr is
bounded and never persisted.

One diff parser feeds validation, rendering and Apply. Binary, malformed,
absolute, traversal, `.git` and symlink-escape patches are rejected. The same
in-memory diff is passed through `git apply --check`. Rendering has explicit
line/file budgets.

Applicability is not correctness. Apply is enabled only for a literally clean
tree and repeats clean-tree, bounds and `git apply --check` validation at click
time before invoking `git apply`. Failures retain review/copy access and do not
run compensating commands that could hide a partial or unsafe state.

### Persistence and local access

Configuration, date/count state and content-free verdicts are written with
mode `0600`. The verdict schema permits timestamps, short hashes, verdicts,
effort roles, repository roots and safe numeric/reason categories; it excludes
captured text, prompts, patches, rationales and stderr.

Premonition does not defend against another process running as the same local
user, operating-system swap, memory inspection by a privileged actor, or the
provider’s retention policy.

### Fixture and distribution boundaries

Fixture replay is local and produces no model egress, but fixture content is
still untrusted and crosses the real gate, resolver, parser, bounds and
`git apply --check` boundaries. DEBUG fixture recording is an explicit
content-persistence exception and must not be silently enabled.

Unsigned local development bundles are not distribution artifacts. The
release pipeline must fail before mutation when a Developer ID identity or
owner-confirmed notary profile is absent. Publication is a separate owner
decision after signed-artifact verification.

## Residual risks

- Stack-trace heuristics can admit false positives and miss unfamiliar formats.
- Admitted copied errors can contain secrets; v0.1 performs no redaction.
- Prompt injection and hostile repository context can shape Sol’s response even
  though the executor is read-only and the patch is independently bounded.
- Sol output is probabilistic; a live attempt may fail validation or produce an
  applicable but incorrect patch.
- Canonical path and clean-tree checks reduce time-of-check/time-of-use risk but
  cannot stop a concurrent same-user process from racing local files.
- Subprocess stdout is retained in memory for the duration of a bounded call;
  a pathological but authenticated CLI stream can increase transient memory
  use. It is not persisted.
- Ephemeral CLI mode was empirically checked, but Premonition cannot guarantee
  provider-side retention or future CLI implementation details.
- Without an installed Developer ID identity and configured notary profile, no
  signed judge artifact can be produced or verified.
