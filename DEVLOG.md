# Premonition Dev Log

This is the human side of the Premonition build: what changed, why it mattered and what happens next. Every entry is derived from the matching factual entry in `BUILDLOG.md`; this diary is context, not evidence.

---

## P0 — The project began on paper

**Date:** 2026-07-12

Premonition started with a fairly sharp promise: copy an error and have a possible fix waiting before you have decided what to do next.

The first specification mapped the whole shape of that idea—the clipboard gate, repository allowlist, speculative patch, validation and human-controlled Apply path. It also proposed using Peripheral as the starting scaffold.

No application code existed yet. Neither did a repository or a captured Codex session. This was the plan before the build, not the build itself.

The next job was to make the specification genuinely standalone and implementation-ready.

**Source:** `BUILDLOG.md`, Entry P0

---

## P1 — Premonition became its own project

**Date:** 2026-07-13

The specification was rebuilt with GPT-5.6 Sol, and the biggest decision was subtraction: Peripheral is gone.

Premonition will now start from an empty repository with its own SwiftPM structure, native app-bundle scripts and process-running contract. Sol is pinned for runtime speculation, escalation and rationale. The direct API executor moved out of v0.1 before it could become a second authentication and privacy surface.

This was still planning, but it removed the parts most likely to make implementation ambiguous. It also made the provenance claim concrete: Sol is both the runtime engine and the build partner, with evidence required for both.

Next came turning that specification into something a fresh Sol session could operate without improvising.

**Source:** `BUILDLOG.md`, Entry P1

---

## P2 — Give Sol the map before asking it to drive

**Date:** 2026-07-13

The project now has an operator: `build-premonition`.

The skill does not duplicate the specification. It finds the authoritative copy, reads the current build state, protects the settled invariants and selects only the earliest eligible S0–S6 phase. It also routes macOS work to the right supporting playbooks without letting generic advice quietly replace Premonition's architecture.

There is still no application repository. That is the point of the next session, not something to blur into this one.

The next move remains S0: establish the repository, capture `/feedback`, pin the tool contracts and prove the scaffold.

**Source:** `BUILDLOG.md`, Entry P2

---

## P3 — We built the record before the app

**Date:** 2026-07-13

Premonition still has no application code. Deliberately.

If this is going to be described as something designed and built with Sol, that trail needs to exist before implementation—not be reconstructed afterwards when the submission asks awkward questions.

Today we created a dedicated build-log skill. It separates what Sol implemented, what the owner decided, what was actually verified and what the next session is allowed to assume.

The pleasingly recursive bit: its first real job was logging its own creation.

The machinery is in place. The app is not. Next comes S0: create the repository, capture the durable Sol session ID and establish the complete scaffold.

**Source:** `BUILDLOG.md`, Entry P3

---

## P4 — Two logs, two jobs

**Date:** 2026-07-13

The build log now has a companion.

`BUILDLOG.md` remains the thing a fresh Sol session can trust: exact outcomes, verification, provenance, deviations and the next legal move. `DEVLOG.md` gets to explain why the work mattered and what it felt like without quietly becoming evidence.

The logging skill now maintains both. Each material session gets one shared ID, the diary points back to its factual source, and the checker makes sure the two do not drift apart. Merge & Tell supplies the voice only after the facts are settled.

We also looked at the third record: the Sol ledger. The specification already treats stable session evidence and ledger rows as primary, with a `Co-developed-with` commit trailer as supporting metadata. No `[CODEX]` prefixes or harness changes were adopted today.

The next decision is whether to make richer Git trailers and an automated provenance-completeness check part of S0. Then, finally, the app.

**Source:** `BUILDLOG.md`, Entry P4

---

## P5 — The paper trail has somewhere to live

**Date:** 2026-07-13

Premonition now has a repository-authoritative specification—and a public history that begins before the app does.

Version 2.1 makes the provenance design binding. Sol-assisted commits keep ordinary useful subjects and carry structured trailers underneath. A repository checker will verify that the ledger, sessions, commits and paired logs agree, while stopping short of the impossible claim that metadata can prove who wrote a line of code.

The factual build log and this diary are now part of `tcballard/Premonition` alongside the specification and existing MIT licence. The baseline is intentionally honest: this is planning and project infrastructure. There is still no application implementation and no captured core-build Session ID.

That changes next. S0 starts from this record, captures `/feedback`, creates the Sol ledger and turns the empty project into a verified macOS scaffold.

**Source:** `BUILDLOG.md`, Entry P5

---

## P6 — I put it on main. That was wrong.

**Date:** 2026-07-13

The three project documents landed in the right repository through the wrong workflow. They were committed directly to `main` instead of arriving as a pull request.

That is now corrected without pretending it did not happen. The direct commit has an ordinary revert on `main`; no force-push, no tidied-up history. The documents now live on `agent/add-premonition-project-records` behind draft PR #1.

The factual log keeps P5 because it happened. P6 records the correction. Slightly uncomfortable is better than suspiciously perfect.

Next, the PR gets reviewed and merged deliberately. S0 still starts afterwards, with `/feedback`, the Sol ledger and the provenance checker—not before.

**Source:** `BUILDLOG.md`, Entry P6

---

## P7 — A PR is not yet the PR standard

**Date:** 2026-07-13

The correction got the documents off `main` and behind a draft PR. Then the owner supplied the actual house style: SortingHat #14.

It is more than a branch-versus-main rule. The work starts with a scoped issue, lives on a `codex/issue-…` branch, carries the issue into the commit and PR title, and gives the reviewer an explicit map: what is in, what is out, which decisions matter, what ran and where to read first.

Premonition now records that contract in the specification. The older `agent/` draft remains part of the audit trail but is closed, unmerged and superseded by issue #2 and draft PR #3. Codex identity stays visible in the branch and the richer Sol trailers, not stapled noisily onto every subject line.

The documents still are not on `main`. That only happens after review. Next is a deliberate look at PR #3, then S0 with the stable session, ledger, `AGENTS.md` and provenance checker.

**Source:** `BUILDLOG.md`, Entry P7

---

## S0.1 — The shell exists; the model contract blinked

**Date:** 2026-07-14

Premonition now has a real native menu-bar shell, not just a plan. SwiftPM builds it, the repository stages an actual `.app`, and one run script owns the developer loop. The shell is intentionally inert: no clipboard watcher, no executor and no patch path have leaked in from S1.

The less comfortable result came from the live Sol benchmark. All fifteen shallow-fixture outputs failed `git apply --check`. Medium effort was quickest on the median, but zero valid patches means speed is not a useful winner and no runtime default has been selected.

The rest of the foundation is in place: deterministic demo failures, a measured ephemeral CLI contract, the prior/new boundary, stable session provenance and repository checks. The staged app launches as an `LSUIElement` menu-bar process on the macOS 14 floor.

So S0 is partial, not complete. The next move is narrow: isolate why the CLI output is invalid, rerun the benchmark after the contract correction, then earn the S1 entry gate rather than declaring it.

**Source:** `BUILDLOG.md`, Entry S0.1

---

## S0.2 — The model was fine; the ruler was bent

**Date:** 2026-07-14

The zero-out-of-fifteen result was real output from a broken measurement contract. The benchmark sent raw final text straight to Git, while Premonition's actual validator permits one surrounding Markdown fence. Worse, it threw away the reason each check failed.

The corrected harness now measures the contract the product will use and reports only safe shape and reason enums. Low effort landed five applicable patches from five attempts. Medium and High each landed four; High took noticeably longer on the median.

That gives S0 its defaults: Low for the first pass, Medium for escalation and Low for the short rationale. Every call stayed pinned to GPT-5.6 Sol. Luna and Terra remain outside v0.1, exactly as the specification requires.

The full scaffold suite and real app-bundle launch are green again. S0 is complete. Next is the headless safety core—not the live executor, not the clipboard UI, and definitely not a victory lap around a misleading benchmark.

**Source:** `BUILDLOG.md`, Entry S0.2

---

## S0.3 — Stop at the clean seam

**Date:** 2026-07-14

This is a good place to put the tools down. S0 is complete, its two commits are pushed, and the draft PR is waiting for review rather than quietly drifting into S1.

Nothing new was squeezed into the final minutes. The benchmark correction, selected Sol efforts and exit verification stay in S0.2; this entry simply makes the handoff explicit.

When the build resumes, it starts with the headless safety core. The real executor still belongs to S2. One phase at a time.

**Source:** `BUILDLOG.md`, Entry S0.3

---

## S1.1 — The safety spine is real

**Date:** 2026-07-14

Premonition now has a headless safety core. Clipboard candidates are filtered before content is read, repositories are resolved through canonical allowlisted paths, patches cross one parser and bounds check, and Git validation remains non-mutating.

The useful moment came during review. Three things looked finished but were not quite contract-tight: configuration covered only part of its locked shape, deduplication leaned on the short logging hash, and the verdict list stopped too early. All three were corrected before the phase was called complete. That is exactly what the review gate is for.

The named A2, A5, A6, A7 and A9 headless contracts are green, alongside the wider unit and integration suite. The process runner also has real stdin, line streaming, bounded error capture, timeout and cancellation behaviour.

This is still deliberately not the live product loop. There is no production Codex executor and no clipboard UI. Next comes S2: wire the already-measured Sol contract into this safety spine without loosening it.

**Source:** `BUILDLOG.md`, Entry S1.1

---

## S2.1 — Sol crossed the runtime boundary

**Date:** 2026-07-14

Premonition now has a real Sol executor. It invokes Codex with the model pinned, the sandbox read-only, approvals disabled and sessions ephemeral; it accepts a result only after the JSONL stream says the turn completed.

The live shallow run worked. Sol produced an applicable patch, the canonical validator accepted it and the temporary repository stayed untouched. The deterministic paths cover the less photogenic but more important cases too: one escalation, terminal second failure, timeout, cancellation and bounded rationale.

Two measurement wrinkles were worth keeping honest. Python created a cache before the first mutation assertion, so the harness was corrected and rerun. More seriously, GitHub's squash merge stripped S1's provenance trailers. `main` was not rewritten and the checker was not quietly relaxed; the exact exception is now append-only and machine-checked.

This is still headless. The model path exists, but nobody using the menu bar can reach it yet. S3 is where the product surface finally meets the safety spine.

**Source:** `BUILDLOG.md`, Entry S2.1

---

## S3.1 — The menu-bar shell became a product loop

**Date:** 2026-07-14

Premonition can now do the thing its menu-bar shell has been promising. It watches locally, admits only error-shaped text tied to an allowed repository, asks the pinned Sol executor for a patch and holds a validated fix for an explicit human choice.

Apply is intentionally fussy. It checks the worktree again at the moment of the click, validates the patch again, uses only `git apply` and leaves the result unstaged. Copy and Dismiss release the candidate without touching the repository. Pause cancels work instead of merely changing an icon.

Integration testing found two unglamorous but important process bugs: an EOF handler could spin, and a blocking wait could deadlock the async task running Codex or Git. Both are fixed, and the complete repository suite now passes with the new functional surface in place.

This is not the polished S3 finish yet. The app bundle launches, but the owner still needs to walk the fresh-config onboarding and the real clipboard-to-click path before A1, A8 and A14 can be claimed. That hands-on pass—and the UI/accessibility review it informs—is the next move.

**Source:** `BUILDLOG.md`, Entry S3.1
