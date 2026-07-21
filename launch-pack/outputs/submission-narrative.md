# OpenAI Build Week submission narrative — owner review draft

> **Do not submit this text as-is.** It is an evidence-grounded drafting aid,
> not the owner's final voice. OpenAI's Build Week guidance asks entrants not
> to paste an AI-written project description unchanged. Tom Ballard must edit
> the description in his own words, confirm the personal declarations and give
> separate approval before anything is saved to or submitted through Devpost.

**Prepared:** 2026-07-21

**Live Devpost form inspected:** 2026-07-21T05:53:29Z

**Existing Devpost project:** `1326961` — “Untitled”, unpublished
`submission_pre_draft`

**Category:** Developer Tools

**Submission deadline:** 2026-07-22T00:00:00Z / 2026-07-22 01:00 BST

**Submission authority:** Tom Ballard only

## Core project fields

| Field | Proposed value | State |
| --- | --- | --- |
| Project name | Premonition | Verified draft |
| Tagline | Copy an error, and the fix is already waiting. | Verified draft; product promise, not a guarantee |
| Built with | Swift; SwiftUI; AppKit; Codex CLI; GPT-5.6 Sol; Git | Verified draft |
| Project links | `https://github.com/tcballard/Premonition`; `https://github.com/tcballard/Premonition/releases/tag/v0.1.0` | Verified |
| Demo video | **BLOCKED — public YouTube URL required** | Missing; do not invent or publish without owner approval |

## Description draft for owner rewrite

### Inspiration

The debugging loop often starts in one place and immediately becomes a chain
of context switches: copy the traceback, find the right repository, open an AI
tool, explain the context, wait for a suggestion, then work out whether the
patch is safe even to try. Premonition explores a smaller interface for that
moment: what if copying an error were enough to prepare a reviewable fix, while
the developer kept the final decision?

### What it does

Premonition is a native macOS menu-bar app and ambient interface layer for
Codex. It watches the clipboard locally, but ordinary clipboard content stops
before any model call. A deterministic heuristic first checks for a supported
error shape, then resolves extracted paths only against Git repositories the
developer explicitly allowlists and enforces single-flight and daily-cap
admission.

Only after those checks does Premonition send the copied error verbatim to
Codex, pinned to GPT-5.6 Sol. Sol drafts one bounded unified diff inside an
ephemeral, read-only, no-approval sandbox. Premonition parses and bounds the
diff, rejects out-of-repository or malformed changes, and runs
`git apply --check` without modifying the working tree.

If the candidate is mechanically applicable, the menu-bar eye changes state
and the developer can review a focused semantic diff and a short Sol
rationale. The only outcomes are explicit: **Apply**, **Copy Patch**, or
**Dismiss**. Apply rechecks that the worktree is literally clean and then uses
`git apply`; the edit remains unstaged. Premonition never auto-applies, stages,
commits, runs tests, invokes repository hooks, or executes post-apply commands.

### How I built it with Codex and GPT-5.6

GPT-5.6 Sol has two inspectable roles in Premonition.

At runtime, every real patch and rationale call is made through the Codex CLI
with the model pinned to `gpt-5.6-sol`. The runtime contract is deliberately
narrow: read-only speculation, one candidate, canonical diff validation and a
human decision before any repository mutation.

During Build Week, Codex with GPT-5.6 Sol was also the build partner for the
specification-led implementation: architecture, privacy and threat-model
reviews, SwiftUI/AppKit implementation, tests, native UX refinement, fixture
replay, signing and release evidence, and submission preparation. I retained
the product-scope, privacy, acceptance and publication decisions. The durable
record is visible in `PREMONITION_SPEC.md`, `BUILDLOG.md`, `DEVLOG.md` and
`docs/build-week/sol-ledger.md`, with phase and session trailers in material
commits.

### Safety and privacy boundary

Premonition's safety spine is local gate → allowlisted repository → admission
cap → read-only Sol speculation → one bounded candidate → mechanical
validation → explicit human decision. A ready patch expires after ten minutes,
and tracked or untracked worktree changes block Apply.

The limits are as important as the mechanism. The gate is heuristic. An
admitted error is sent verbatim to Codex and may contain secrets; v0.1 has no
secret-redaction pass and makes no claim about provider-side retention.
`git apply --check` proves mechanical applicability, not correctness, security
or completeness. Live model output can vary.

### A judge-runnable path

The public v0.1.0 release is a signed, notarised and stapled Apple Silicon app
for macOS 14+. Judges can download it without rebuilding. The repository also
contains deterministic shallow and deep fixtures. **Replay Fixture** replaces
only the model hop and is visibly labelled; the real gate, repository resolver,
admission checks, diff parser, bounds validator, `git apply --check`, review UI
and human action still run without network access.

### Prior work and what is new

Premonition had specification v1.1 planning on 12 July 2026, before the
Submission Period. GPT-5.6 Sol-assisted specification and workflow refinement
is recorded on 13 July through commit `2e83e84`. New application implementation
began on 14 July with S0 commit `3422b0c`. No application implementation is
attributed to the pre-period plan; the dated boundary and direct commit links
are documented in `docs/build-week/prior-new-boundary.md`.

### What I learned

The interesting problem was not merely obtaining a plausible patch. It was
designing the admission, validation, privacy and interaction boundaries around
speculation so the experience could feel ambient without becoming autonomous.
The deterministic fixture path also proved useful beyond demos: it makes the
complete product loop inspectable even when network access or live model
variability would otherwise get in the way.

### What's next

Premonition v0.1 intentionally stops at one local, reviewable candidate. Future
work may explore bi-directional MCP integration and a direct OpenAI API
executor, but neither is present in this submission. Automatic mutation,
generic error comprehension, secret redaction and IDE integration are not
implied roadmap commitments.

## Owner rewrite guide against the live judging criteria

| Criterion | Evidence to preserve in the owner's version |
| --- | --- |
| Technological Implementation | The pinned Codex CLI contract, gate/allowlist/cap admission, canonical diff validation, clean-tree Apply boundary, tests and append-only Sol provenance |
| Design | The complete native menu-bar flow, authored monitoring/fix-ready hierarchy, accessibility review and explicit Apply/Copy Patch/Dismiss decisions |
| Potential Impact | Removing context switches from the common copied-traceback debugging moment while keeping review and repository mutation under human control |
| Quality of the Idea | The clipboard as an ambient but locally gated interface to Codex, paired with a deliberately non-autonomous safety spine |

Do not turn these into unsupported superlatives. The final video and description
should demonstrate the evidence rather than merely repeat the criterion names.

## Exact Build Week custom fields

The IDs and requirements below came from the authenticated live OpenAI Build
Week form. Values marked **owner confirmation** are personal declarations and
must not be inferred or completed by the build session.

| ID | Live label | Required | Draft answer | State |
| --- | --- | --- | --- | --- |
| `27945` | Submitter Type | Yes | **Owner confirmation required** (`Individual`, `Team of Individuals`, or `Organization`) | Blocked on owner attestation |
| `27946` | Please indicate your Country of Residence. | Yes | **Owner confirmation required** | Blocked on owner attestation |
| `27947` | Which category are you submitting to? | Yes | `Developer Tools` | Verified |
| `27948` | URL to your public or private code repo. REQUIRED: README & highlight how Codex & GPT-5.6 were used. | Yes | `https://github.com/tcballard/Premonition` | Verified public MIT repository |
| `27949` | If applicable, link to your project for judges to check and test & any necessary instructions | No | Use the private judge-testing answer below | Draft |
| `27950` | /feedback Session ID where the majority of your project was worked on | Yes | `019f5f0f-a2dd-78e3-a5b3-413860708eab` | Verified durable Sol session |
| `27951` | If your project is a plugin or dev tool, provide installation instructions, supported platforms, instructions for testing, etc; | Required for this project | Use the developer-tool answer below | Draft |

### Field 27949 — private judge-testing answer

Signed release:
https://github.com/tcballard/Premonition/releases/tag/v0.1.0

Direct ZIP:
https://github.com/tcballard/Premonition/releases/download/v0.1.0/Premonition-0.1.0.zip

SHA-256:
3d48e5b06342ce8bd11dddf0fa7f8b318e7273dd3e453177b6a2b47ef8d03178

The public release is an Apple Silicon app for macOS 14 or later. No
credentials are required for fixture replay. Live speculation additionally
requires an installed, authenticated Codex CLI.

### Field 27951 — developer-tool installation and testing answer

Supported platform: Apple Silicon Mac running macOS 14 or later.

1. Download `Premonition-0.1.0.zip` from the v0.1.0 release, extract it, move
   `Premonition.app` to `/Applications`, and open it. The app is Developer ID
   signed, notarised and stapled.
2. In first-run Settings, choose **Add Root…** and select a directory containing
   repositories Premonition may resolve.
3. To test without rebuilding or live model access, create the deterministic
   repository with `scripts/make-demo-repo.sh /tmp/Premonition-Demo`, add that
   root in Settings, enable the demo panel, and choose **Replay Fixture**.
   Fixture replay is visibly labelled and needs no network access. It replaces
   only the model hop; the real gate, resolver, admission, diff parser, bounds
   validator, `git apply --check`, review surface and Apply/Copy Patch/Dismiss
   decisions still run.
4. For a live run, install and authenticate the Codex CLI, run `make break` in
   the demo repository and copy the traceback. Live output can vary.

README installation and testing details:
https://github.com/tcballard/Premonition#install-the-signed-release

## Final owner edit and submission gates

- [ ] Rewrite the description in the owner's own voice; do not paste this
  generated draft unchanged.
- [ ] Confirm submitter type.
- [ ] Confirm country of residence.
- [ ] Review project name, tagline, technologies and links.
- [ ] Review the prior/new disclosure and the two Sol roles.
- [ ] Confirm every limitation remains visible and accurate.
- [ ] Produce, verify and explicitly authorise a public YouTube demo no longer
  than three minutes.
- [ ] Insert the final public YouTube URL.
- [ ] Preview the complete Devpost entry at desktop and narrow widths.
- [ ] Give separate explicit authority to save/update the live project, then
  separate explicit authority to submit it.

No Devpost field was written, no video was published and no submission was
made while preparing this artifact.
