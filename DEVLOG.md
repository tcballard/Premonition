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

---

## S3.2 — The menu-bar loop survived the clicks

**Date:** 2026-07-15

S3 is complete. Premonition did not merely produce a plausible card; the owner used the real menu-bar flow, reviewed the result and applied it. The repository received one unstaged edit, the planted failure stopped failing, and the change could be restored cleanly.

The dirty-tree test was the more revealing click. We presented a valid fix, added an unrelated untracked file and then pressed Apply. Premonition refused the mutation, kept Copy patch available and left the target untouched. The demo generator also learned to ignore Python caches, because a safety rule is not very useful if the acceptance fixture accidentally trips it first.

The final review tightened the surface around that behavior: Escape closes rather than dismisses, the gear menu has the missing desktop actions, runtime status is real, Reduce Motion is honoured, and diff colour now reinforces literal line markers instead of carrying meaning alone. Fresh-config onboarding also worked without hand-editing JSON.

The filmable panel still does not exist. That is S4, along with narration, replay presentation and sound. First this S3 completion branch gets reviewed and merged with its provenance intact.

**Source:** `BUILDLOG.md`, Entry S3.2

---

## S3.3 — The popover learned what deserves attention

**Date:** 2026-07-15

The fix-ready popover now has an opinion about sequence. Premonition and its current state lead; the diagnosis and repository establish context; the patch gets a focused editor-like surface; Sol's reasoning sits apart; and Apply is the one action allowed to carry the system accent.

This was mostly a job of restraint. The eye remains the instrument identity, operational facts have moved into quieter edges, and green and red are back to doing semantic work in the diff. There is no status rail, decorative chrome or pretend Liquid Glass competing with the fix.

Underneath, the view split is cleaner without moving the safety boundary. The UI reads from the existing canonical parsed diff through a small presentation projection, while AppKit ownership and every admission, privacy and Apply contract stay where they were. The full 34-test path, release bundle and developer launch all pass.

The remaining gate is appropriately human: inspect a real held fix in the rebuilt popover and decide whether the hierarchy feels as deliberate as the approved direction. Only then should issue #13 be considered done and S4 begin.

**Source:** `BUILDLOG.md`, Entry S3.3

---

## S3.4 — Watching should not look like waiting for a form

**Date:** 2026-07-15

The first installed S3.5 build improved the fix card, but the state seen most often still looked like a sentence stranded in a large popover. The owner called it out, correctly.

The monitoring view is now smaller and more specific. It says what to do next, but it also exposes the product's important restraint: the local gate is active, and Sol waits until a candidate is admitted. That is a better signature than decoration because it explains how Premonition behaves.

The daily fraction has quietened into receipt text, paused mode uses the same visual grammar, and watching remains still. Motion belongs to reasoning, not to proving that an idle utility is alive.

The revised build and full test path pass, and the new bundle is installed for another owner look. The next judgment is visual: does this finally feel like a watchful instrument in its ordinary state, and does the fix-ready transition preserve that character?

**Source:** `BUILDLOG.md`, Entry S3.4

---

## S3.5 — The durable thread has its receipt

**Date:** 2026-07-15

The stable feedback Session ID is now confirmed, and it matches the identifier carried through the build records from S0 onward. That closes the lingering V14 evidence gap without rewriting the earlier entries that honestly said it was unavailable.

Nothing about the product changed here. The remaining work is still the owner review of the monitoring and fix-ready presentations on issue #13.

**Source:** `BUILDLOG.md`, Entry S3.5

---

## S3.6 — The tools are becoming a project too

**Date:** 2026-07-15

Premonition has not only produced an app. It has also exposed a useful set of repeatable ways to work with Codex: keep a durable build record, protect phase boundaries, design native Mac surfaces deliberately, and turn the eventual product into something that can be demonstrated honestly.

Those methods are now being formalised in parallel at [CodexToolkit](https://github.com/tcballard/CodexToolkit). Other sessions are preparing contributions there while this thread stays focused on Premonition; the first visible draft PR establishes a Product Demo skill scaffold.

The boundary matters. CodexToolkit is the workshop around the build, not a hidden dependency inside Premonition. Nothing from it ships in v0.1 merely because it helped shape the process.

For now this is provenance context, not a completion claim. The toolkit is still evolving, and Premonition's immediate gate remains the owner review of the monitoring and fix-ready popovers.

**Source:** `BUILDLOG.md`, Entry S3.6

---

## S3.7 — The parallel workshop has an address

**Date:** 2026-07-15

The CodexToolkit work now has a durable thread handle: `019f647d-1687-7bf1-8b48-769da8e836d2`. It sits alongside the repository and PR trail as the route back to the session formalising the external skills.

It is deliberately recorded separately from Premonition's own durable build thread. The projects inform one another, but their evidence should not blur together.

**Source:** `BUILDLOG.md`, Entry S3.7

---

## S3.8 — The watch state finally became the instrument

**Date:** 2026-07-15

The important correction here is blunt: the previous monitoring pass had not really implemented the owner-approved screen. It moved some words around, but it did not give the ordinary watching state the centered eye instrument, dial, hierarchy and receipt shown in the selected direction.

That is now in the app. The configured, no-fix popover has its own monitoring surface instead of borrowing the fix-card shell: Pause and Settings sit as native controls in the top right, the eye sits inside a radial watch dial, the instruction is centered and quiet, and the bottom receipt carries recent activity and the daily count without turning the counter into the main event.

The safety shape did not move. There is no new model path, no automatic action, no extra persistence of clipboard or patch content, and no demo-panel work smuggled in from S4. The only new state is a content-free timestamp for the receipt.

The build is verified, the app is installed into `/Applications`, and the installed executable matches the freshly built bundle. The next judgment is the right one: look at the actual running monitoring screen, then run the UX/design evaluation against the thing that now exists.

**Source:** `BUILDLOG.md`, Entry S3.8

---

## S3.9 — The scan moved into the instrument

**Date:** 2026-07-15

The tempting version was to make the eye itself look around. That would have been easy, but it would also have nudged Premonition toward feeling like a little watcher with intent.

The dial now does the work instead. Its active band eases across the upper arc and back, which gives the surface a scanning cue without changing the eye into a character. Paused and Reduce Motion still stay still.

This is a small motion change, but it fits the product character better: awake, local and instrument-like, not autonomous. The updated app is installed for the next visual pass.

**Source:** `BUILDLOG.md`, Entry S3.9

---

## S3.10 — The dial now uses the whole dial

**Date:** 2026-07-15

The upper-arc scan was too clever by half. It preserved the instrument feeling, but it did not do the simple thing the owner expected from a circular dial: travel around the circle.

That is corrected now. The eye still does not look around and there is still no pupil glint; the moving part is the dial lobe. But the lobe now progresses through the full ring, with watching slower than speculating and reduced-motion still static.

The updated bundle is installed again for visual review. The next useful step is not more theorising; it is looking at the live menu-bar popover and deciding whether the motion now reads correctly.

**Source:** `BUILDLOG.md`, Entry S3.10

---

## S3.11 — The Sites idea is parked, not started

**Date:** 2026-07-15

The future Sites explainer now has a proper parking space in the repo. That matters because it is useful submission-support material, but it is also exactly the kind of useful thing that could pull focus too early.

The handoff is explicit: do not start Sites yet. The app, README, demo flow, provenance logs and release evidence need to settle first. Nothing has been created, deployed, published or promoted.

This does not change Premonition itself. Runtime scope, S3/S4 boundaries and the v0.1 safety invariants stay exactly where they were. The next work remains owner review of the actual app surface.

**Source:** `BUILDLOG.md`, Entry S3.11

---

## S3.12 — The build method is becoming reusable

**Date:** 2026-07-15

The Premonition-specific skills are no longer just local scaffolding around this one build. The owner has confirmed that the build and log-maintenance skills used here are also being added into CodexToolkit.

That is worth recording because these skills have shaped the way this project has stayed honest: phase boundaries, paired logs, Sol provenance, and stopping bright ideas from quietly becoming runtime scope.

It still changes nothing inside Premonition. CodexToolkit is external workflow infrastructure, not an app dependency. The next Premonition move remains the actual issue #13 review path: look at the installed UI, run the design evaluation, fix what needs fixing, then close the PR before S4.

**Source:** `BUILDLOG.md`, Entry S3.12

---

## S3.13 — The gear now reaches the window it promised

**Date:** 2026-07-16

The Settings item looked native, but it was wired through `SettingsLink` inside a SwiftUI view manually hosted by `NSPopover`. That view did not reliably inherit the app's Settings-scene environment, so the control could simply lead nowhere.

The popover now hands the action back to `AppController`. First-run onboarding and the gear menu share one opener: close the transient popover, activate the accessory app, then ask the existing Settings scene to show its window. No product state or runtime safety boundary moved.

The focused regression and all 38 Swift tests pass, as do the repository suite and bundle build. The exact verified executable is installed and running from `/Applications`.

The remaining proof is appropriately small and human: click the installed gear menu and confirm that Settings appears and takes focus. After that, issue #13 returns to its broader visual-review gate.

**Source:** `BUILDLOG.md`, Entry S3.13

---

## S3.14 — This time the rebuild really was clean

**Date:** 2026-07-16

The first Settings repair was present in the installed binary, but the window still did not appear for the owner. That ruled out the comforting explanation that we had merely copied the wrong executable.

There was still a timing flaw: the app asked SwiftUI to show Settings while the gear menu was closing. The action now waits one main-loop turn, after the menu and transient popover have finished unwinding.

The rebuild also started from an actual empty slate. SwiftPM's 436 MB local build cache, both application bundles, duplicate Launch Services registrations and the old SwiftUI window preferences were removed. Premonition's real Application Support configuration was deliberately preserved.

All 38 tests pass from the clean build, the release executable was matched before installation, and only the fresh `/Applications/Premonition.app` copy remains. The automation bridge still cannot see this accessory app, so the next step is one honest manual click. If that still fails, the next repair is an explicit `NSWindowController`, not another cache purge.

**Source:** `BUILDLOG.md`, Entry S3.14

---

## S3.15 — Settings finally owns a real window

**Date:** 2026-07-16

The clean rebuild settled the argument: this was not an old app, a duplicate bundle or a stale frame. The SwiftUI Settings responder simply was not a dependable way into a window from this accessory popover.

That mechanism is gone. `AppController` now owns one native `NSWindowController` for the lifetime of the app, and that window hosts the same SwiftUI Settings form we already had. First-run onboarding and the gear menu reach the same object directly. Closing it does not release it; opening it again brings the same window forward.

The test now does the useful thing rather than checking a selector name: it shows the window, sees it become visible, closes it and verifies that the controller still owns that exact instance. The full 38-test path passes, and the matching release is the only Premonition bundle left installed.

One manual click remains because the automation bridge still cannot enumerate this menu-bar-only app. But there is no responder chain left to blame now: gear → Settings calls a concrete window controller.

**Source:** `BUILDLOG.md`, Entry S3.15

---

## S3.16 — The gear stopped pretending to be an application menu

**Date:** 2026-07-16

Once Settings had a window it actually owned, the gear's remaining submenu felt like an unnecessary extra stop. Opening a popover, opening another menu, then choosing Settings was ceremony where the user expected a button.

The gear is now exactly that button. The quieter application-level commands have moved to the menu-bar eye's native right-click menu: Settings, Open Config File and Quit. Left-click still opens Premonition itself, so the product's primary path has not become a menu of utilities.

This is a better native split and a cleaner hierarchy. It also leaves the hard-won explicit Settings controller intact: first run, the gear and the context menu all reach the same retained window. Forty tests pass, the installed release matches the build, and the next decision is visual rather than architectural.

**Source:** `BUILDLOG.md`, Entry S3.16

---

## S3.17 — Native content still needs native placement

**Date:** 2026-07-16

The menu had the right commands and the wrong relationship to the menu bar. Presenting it as a cursor context menu made AppKit align it to the click point, so it climbed over the system chrome instead of dropping cleanly beneath the eye.

That primitive is gone. The app now finds the status button's bottom edge in screen coordinates and anchors the native menu there, while keeping the button highlighted during tracking. The interaction split itself has not changed.

The focused coverage now includes that anchor, all 41 tests pass, and the corrected release is installed. The remaining check is the obvious one: right-click the eye and look at where the menu begins.

**Source:** `BUILDLOG.md`, Entry S3.17

---

## S3.18 — The button was not the bar

**Date:** 2026-07-16

The second screenshot made the remaining mistake clear. The menu was anchored below the eye's button, but that button floats inside a taller menu bar. Its lower edge was still several points above the system boundary, so the menu continued to intrude into the chrome.

The app now asks the screen where its usable area actually begins and uses that boundary. There is no guessed seven-point correction; the placement adapts to the current display and falls back safely when the menu bar auto-hides.

All 41 tests still pass and the matching release is installed. The next check is visual again, but this time the geometry describes the bar rather than the icon inside it.

**Source:** `BUILDLOG.md`, Entry S3.18

---

## S3.19 — The buttons now finish their sentences

**Date:** 2026-07-18

Three small interaction failures were making the fix-ready state less trustworthy than its visual polish suggested. Dismiss left the app saying a fix was still ready, Copy Patch immediately talked over its own success message, and the keyboard did not have a dependable place to land.

Those paths now end cleanly. Each decision leaves its own quiet receipt, Premonition ignores only the pasteboard change it authored itself, and the action row has explicit focus ownership with Apply leading only when it is safe.

The final build also exposed an environmental wrinkle: files in the workspace changed modification times during compilation. Rather than call an invalid build green, verification moved to an exact temporary snapshot, where all 44 tests and the prescribed bundle paths passed. The matching release is installed.

The remaining gate is human and visual: walk Dismiss, Copy Patch, keyboard traversal, Escape and both appearances in the installed app. Then issue #13 can be prepared for review; S4 still waits.

**Source:** `BUILDLOG.md`, Entry S3.19

---

## S3.20 — The owner pass is green

**Date:** 2026-07-18

The last S3 check was not another test command. It was using the installed app: dismissing a fix, copying a patch, moving through the actions from the keyboard, closing with Escape, and looking at the surface in both appearances.

The owner has confirmed that pass. That closes the issue #13 visual gate and turns the remediation plan from a working checklist into an acceptance record.

The branch still needs its deliberate commit and draft PR refresh, and nothing is being merged yet. Once that review package is ready, S3 can wait at the proper boundary before S4 begins.

**Source:** `BUILDLOG.md`, Entry S3.20

---

## S4.1 — The filmable phase has a clean starting line

**Date:** 2026-07-18

The authored popover is no longer a branch waiting for judgment. PR #14 is squash merged, its Sol trail survived the merge, and the owner-accepted instrument is now the baseline.

Getting local `main` there was briefly less elegant than the product. Git's fast-forward was interrupted by a filesystem cancellation and left half of the new tree checked out. Because the branch had been clean, the recovery could be exact: restore from the confirmed remote commit, validate the logs and provenance again, and move on without rewriting anything.

S4 now has issue #15, its own branch and a durable plan. The important boundary is already visible in that plan: the demo panel may narrate stages, but it stores no captured content; fixture replay may replace the model hop, but the gate, repository resolution, admission, validation and human decision remain real.

No S4 runtime code exists yet. Next comes the content-free stage model and the non-activating panel, followed by the offline replay evidence that makes the demo resilient without pretending it was live.

**Source:** `BUILDLOG.md`, Entry S4.1

---

## S4.2 — A filmable shadow, not a second product

**Date:** 2026-07-18

Premonition now has a second surface, but not a second source of truth. The floating panel narrates only content-free stages and an honest clock; the actual gate, repository resolution, Sol call, validation and human decision still happen in the pipeline we already trust.

Offline replay follows the same rule. It replaces only the model hop with a timed local fixture. Everything around that hop remains real, and the UI says `Fixture replay` instead of asking a judge to guess. The fixture is bundled into the app, so the resilient path does not depend on hand-editing a config file.

The privacy decision was to avoid building a recorder just because the specification permits one. A repository-authored fixture satisfies the offline evidence without adding a new content-bearing persistence path. That is the smaller and safer S4.

Fifty-one tests pass, including A11 and A12, and the exact release with its fixture is installed. What remains is visible evidence: use the panel, watch the stages and timer, confirm it never steals focus, then run replay with networking disabled before packaging the branch for review.

**Source:** `BUILDLOG.md`, Entry S4.2

---

## S4.3 — The resilient demo loop is ready for review

**Date:** 2026-07-18

The last S4 gate was deliberately ordinary: use the installed app, watch the panel tell the truth about what it is doing, and then remove the network. The owner has approved that pass. Replay still reached the same local gate, repository, validation and review surfaces without quietly becoming a staged animation or a model call in disguise.

The final verification ran again from a fresh stable snapshot. All 51 tests, the repository wrapper, release bundle and developer launch passed. A tiny fixture-format issue surfaced during staging: valid blank diff context looked like trailing whitespace inside the repository. The final fixture keeps the applicability context without carrying that whitespace, and focused A12 passed again.

The implementation is now commit `778517d` on the issue #15 branch and draft PR #16 is open. The panel, replay and sound remain S4 presentation tools around the existing safety spine; they do not change when Premonition may call Sol or mutate a repository.

That is the end of S4, not permission to drift into release work. The next move belongs to the owner: review and merge the draft while preserving provenance. S5 starts only after that merge is confirmed.

**Source:** `BUILDLOG.md`, Entry S4.3

---

## S5.1 — The demo is merged; now it has to survive release scrutiny

**Date:** 2026-07-18

PR #16 is merged, and its squash commit kept the two S4 provenance records intact. The filmable loop is no longer branch work; it is the product baseline.

S5 is a different kind of pressure. The app works, but the repository still has no README, SECURITY or CHANGELOG, no signing/notarisation path, no independent release verifier and no prepared Homebrew surface. The architecture and threat model also still talk as if the live executor and product UI are future work.

Issue #17 and the new plan make that gap explicit. Evidence comes first: every A1–A14 result must say whether it is deterministic, live, owner-observed or blocked. Signing stays behind real owner-provided identity and notary inputs, and nothing in this phase authorises publication.

The next move is the baseline acceptance register and machine-capability inspection. Only then do we harden what the evidence says is actually missing.

**Source:** `BUILDLOG.md`, Entry S5.1

---

## S5.2 — A green suite is not the same as complete evidence

**Date:** 2026-07-18

The merged product still passes all 51 tests, but S5 is forcing a more useful question: what does each test actually prove?

The new acceptance register does not let historical, skipped or neighbouring coverage blur together. The money path has real earlier evidence, but the current baseline did not call Sol. A2 passes a small negative set, not yet the full corpus or workday simulation. A10 and fresh-machine onboarding also need current evidence rather than inheritance by confidence.

The distribution check was equally plain. This Mac has the tools—Xcode, notarytool, stapler and Homebrew—but no valid code-signing identity. The installed app is exactly what it has been so far: an ad hoc development bundle, not a Gatekeeper-ready release.

So the next move is not to fake a release command. It is to close the deterministic acceptance gaps and build the documentation and tooling that can be verified now. Signing waits for a real owner-provided identity and notary profile.

**Source:** `BUILDLOG.md`, Entry S5.2

---

## S5.3 — The honest stopping point is the credential gate

**Date:** 2026-07-18

S5 has now done the work that can actually be done on this Mac. The acceptance
register is no longer a list of inherited confidence: the negative clipboard
set is broad, the normal-workday simulation stays at zero egress, the deep
fixture proves the one-step escalation, dirty trees are rechecked after
presentation, held fixes really exclude replacements, and onboarding runs in
an isolated support directory instead of risking the owner’s active setup.

The live evidence was usefully imperfect. Sol produced an applicable patch on
the first current run and no applicable patch on the deliberate repeat. That is
exactly why the product says “validated” rather than “correct,” and why offline
fixture replay matters. The repeat also left the aggregate ephemeral-session
count unchanged; the earlier one-file increase remains labelled inconclusive
instead of being reverse-engineered into a convenient story.

The final review found one actual privacy/lifecycle issue: a rationale could
keep running after the person had paused or finished with the fix. That task is
now owned by the candidate and cancelled with it. The rest of the release work
is similarly explicit. README, SECURITY and CHANGELOG tell the whole truth;
the architecture and threat model describe the product that exists; the
signing script refuses to move without real inputs; and the Homebrew cask keeps
visible placeholders rather than inventing an artifact.

Fifty-five tests, the repository wrapper, release bundle, independent unsigned
verification, launch check, README audit and Homebrew style all pass. The only
remaining work is genuinely hard-blocked: this Mac has no Developer ID
identity, the session has no owner-confirmed notary profile, and therefore
there can be no stapled judge artifact, final cask metadata or owner release
review yet. Nothing was published and S6 has not started.

**Source:** `BUILDLOG.md`, Entry S5.3

---

## S5.4 — The review package is ready; the release is not

**Date:** 2026-07-19

Everything S5 could honestly finish without the owner's distribution credentials is now in draft PR #18. The commit carries the required Sol trail, the pushed branch passes the independent paired-log and provenance checks, and the PR explains both the evidence and its limits.

That distinction matters. This is a reviewable release-candidate change set, not a signed release candidate. There is still no Developer ID identity on this Mac, no confirmed notary profile, no stapled artifact and no final Homebrew metadata. None of those boxes have been softened just because the code is now on GitHub.

The next useful action is owner review of the draft. After that, S5 still needs the real credential-assisted signing and installed-artifact pass before it can finish. Nothing has been published, merged or moved into S6.

**Source:** `BUILDLOG.md`, Entry S5.4

---

## S5.5 — Merged is not the same as released

**Date:** 2026-07-19

PR #18 is merged, and the important part survived the squash: both S5 commits still carry their Sol session, phase and build-log trail. The repository now has the hardening work, the honest front door and the release machinery on `main`.

The local update was less graceful. The Mac's File Provider cancelled Git's normal fast-forward twice, leaving partial file writes. Because the starting tree was known clean, the recovery could be stricter than another hopeful retry: apply the exact merged patch, compare the entire resulting tree hash with remote `main`, and move the reference only when they match.

That leaves a useful distinction intact. The hardening PR is merged, but S5 is still open. There is no Developer ID identity, confirmed notary profile, stapled artifact or installed release-candidate approval yet. Issue #17 remains the place for those gates, and nothing has moved into publication or S6.

**Source:** `BUILDLOG.md`, Entry S5.5

---

## S5.6 — A field guide, still behind the glass

**Date:** 2026-07-19

The Sites handoff was written to stop us building the wrapper before the product. The product is now far enough along that the remaining S5 work is genuinely waiting on distribution credentials, so the owner opened a narrow exception: shape the explainer now, but do not deploy it and do not pretend S6 has begun.

The result feels more like an exhibit label beside an instrument than a launch page. It leads with the promise, turns the safety spine into the structure, quotes the privacy constitution exactly and makes the two Sol roles inspectable. The eye and admission dial carry the product identity without importing the app's chrome into a browser or collapsing into generic AI marketing.

The uncomfortable truths stay visible. `git apply --check` proves applicability, not correctness. Admitted errors leave verbatim. There is no secret-redaction or provider-retention claim. The signed release is still pending, so there is no download button wearing a disguise.

Desktop, tablet and mobile layouts hold together, the source/build contracts pass, and Sites version 1 points to an exact standalone source commit. It remains behind the glass: no live URL, no preview URL, no deployment and no promotion. Before that changes, it still needs owner review and a real keyboard pass, and Premonition still needs the signed artifact that keeps S5 honestly open.

The final provenance check also caught a separate piece of unfinished bookkeeping: PR #19's squash kept its title but dropped the verified S5.5 trailers. The append-only exception now links the exact source and squash commits rather than rewriting `main` or letting a green checker hide the gap.

The branch is now in draft PR #21. That is the review surface, not a launch switch.

**Source:** `BUILDLOG.md`, Entry S5.6

---

## S5.7 — Behind a real door

**Date:** 2026-07-19

The field guide now has a real production door, but it is still a private review room. The owner explicitly lifted the no-deployment stop, Sites confirmed the access list contains only the owner, and version 1 is live behind Sign in with ChatGPT.

That distinction is worth keeping sharp. A production URL exists; a public launch does not. Nothing about the app, release state or S6 completion changed just because the explainer can finally be seen outside localhost.

`premonition.tcballard.dev` is attached too, but DNS is honest in its own way: the necessary CNAME and validation records are not there yet, so the hostname is pending and the certificate is still being prepared. The generated Sites URL is the working review route until those records land.

The next move is human again. Sign in through the open browser tab, review the actual page, add the DNS records, and then let the tooling verify the custom hostname rather than declaring it finished early.

**Source:** `BUILDLOG.md`, Entry S5.7

---

## S5.8 — One page, one idea

**Date:** 2026-07-19

The first explainer was accurate but behaved like a guided exhibition: six sections, a sticky narrator and more than seven thousand pixels of desktop scroll. The owner wanted a page, not a tour.

The Toolkit-led rework removed whole systems rather than polishing them. What remains is one instrument plate: the promise and watch dial, the seven-step loop in a single rail, and the safety contract underneath. The eye still gives Premonition its identity, but it no longer has to compete with a second stage instrument, five ledgers and a closing billboard.

The reduction did not buy simplicity by dropping the awkward truths. The copied error can leave verbatim only after admission. There is no redaction or provider-retention claim. Apply remains human, and `git apply --check` still proves applicability rather than correctness. The evidence links are smaller, not missing.

Desktop height fell from 7,221 to 1,684 pixels, the source and build contracts pass, and version 2 is deployed behind the same owner-only door. The next verdict belongs to the owner after sign-in; the custom domain and signed app are still separate unfinished gates.

**Source:** `BUILDLOG.md`, Entry S5.8

---

## S5.9 — A door with the right label

**Date:** 2026-07-19

The README now points to the deployed explainer, but it does not pretend the door is public. The raw Sites URL sits in the opening block with the important qualification beside it: owner review, ChatGPT sign-in required.

That is less elegant than `premonition.tcballard.dev`, but more honest today. The custom hostname is still waiting on DNS and a certificate, so putting it in the repository front door would turn a future intention into a broken current claim.

Once the canonical domain is genuinely active and its access policy is deliberate, the generated address can disappear. Until then, reviewers can find the real door and understand why it asks them to sign in.

**Source:** `BUILDLOG.md`, Entry S5.9

---

## S5.10 — The release candidate is real now

**Date:** 2026-07-19

The long-standing credential gate finally became a build rather than a sentence in the plan. The general Developer ID identity was already on the Mac; once the `Premonition` notary profile existed, the repository's deliberately fussy release script did exactly what it was meant to do.

Apple accepted the submission, the ticket stapled, and the independent pass checked both the app and a fresh extraction of the ZIP. The same candidate is now installed in `/Applications`, still carrying its Developer ID authority and notarisation ticket. Nothing was uploaded to GitHub and the cask remains prepared rather than published.

One toolchain wrinkle remains. Homebrew now refuses to run its strict audit with Xcode 26.6 because it expects Xcode 27.0. That is not being disguised as a clean audit, even though the cask contract, Ruby syntax and style checks pass.

The next meaningful evidence is human: use the installed candidate and decide whether it is the build we are willing to release. After that, the remaining choice is whether the Xcode update is worth doing or whether the specification's allowed Homebrew-polish cut is the honest call.

**Source:** `BUILDLOG.md`, Entry S5.10

---

## S5.11 — Approved where it matters

**Date:** 2026-07-19

The signed build has crossed the last human product gate: the owner used the installed candidate and approved it. That verdict belongs beside the cryptographic evidence, not in place of it. Apple acceptance, Gatekeeper, the stapled ticket and the clean ZIP extraction still prove their own narrower things; the owner proves this is the candidate worth carrying forward.

The Homebrew wrinkle remains deliberately unresolved. Approval of the app does not turn an Xcode-version refusal into a passing strict audit. The cask is populated, syntax-clean and style-clean, but the choice between updating Xcode and taking the specification's permitted polish cut still needs to be made explicitly.

For now, the honest next step is a draft PR: make the signed evidence reviewable, keep the release private, and decide the cask-audit question without reopening the product itself.

**Source:** `BUILDLOG.md`, Entry S5.11

---

## S5.12 — A branch name is not worth rewriting history

**Date:** 2026-07-19

The signed-candidate push found an old piece of honest history: GitHub still retains the earlier issue #17 completion branch from PR #19. A force-push would have made the new name convenient by making the old review surface less trustworthy.

So the new package moved instead. `codex/issue-17-signed-candidate` says exactly what this increment contains and leaves the older branch untouched. Nothing about the app, evidence or release boundary changed; only the route to review became safer and clearer.

**Source:** `BUILDLOG.md`, Entry S5.12
