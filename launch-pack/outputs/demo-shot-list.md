# Premonition Build Week demo shot list

> **Plan mode only.** No footage has been captured or selected. Every product
> interaction below must be recorded from the signed Premonition v0.1.0 app.

## Source and staging contract

- **Application:** `/Applications/Premonition.app`, bundle identifier
  `co.armytage.Premonition`, signed v0.1.0 Apple Silicon candidate.
- **Fixture repository:** a disposable `/tmp/Premonition-Demo` created by
  `scripts/make-demo-repo.sh`; never substitute a personal repository.
- **App state:** watching, demo panel enabled, sound off unless specifically
  approved, `/tmp/Premonition-Demo` as the only visible allowlisted root.
- **Display:** capture at the Mac's native resolution and a stable 30 fps;
  compose the final edit at 1920 × 1080.
- **Terminal:** large readable monospaced type, short neutral prompt, no user
  name, hostname, shell history, unrelated paths or environment values.
- **Browser evidence:** logged-out or clean profile showing only public
  Premonition repository pages; no account avatar, tabs, bookmarks or
  notifications.
- **Audio:** capture clean system sound separately; owner narration is recorded
  after the picture sequence is approved.

## Required shots

| ID | Purpose | Starting state | Action | Ending state | Capture | Audio | Handles | Usability gate | Claim IDs |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| S01 | Establish the watchful product identity and promise | Signed app watching; popover closed; clean menu bar | Click the eye and let the monitoring dial complete part of a sweep | “Watching for errors” and the quiet receipt are readable | Tight menu-bar/popover crop from full-display source | Silence; narration later | 2s / 2s | Eye, dial, title and instruction are sharp; no unrelated notification enters | C01 |
| S02 | Show the real shallow trigger | Dedicated demo repo clean at broken baseline; app watching; panel visible and labelled Live run | Run `make break`, select only the traceback and copy it | Menu-bar eye enters speculation and panel begins at Gate passed | Terminal plus menu-bar/panel; keep full action continuous | Terminal keystrokes only | 2s / 3s | Traceback path resolves to the demo repo; no private path or prior command is visible | C02, C03, C04 |
| S03 | Show the real Sol and validation wait honestly | Continue the exact S02 take | Wait through repository, Sol and validation stages; if needed, mark this interval for disclosed 4× playback | Eye reaches Fix ready and panel reaches Applies cleanly | Panel and menu-bar detail from same continuous take | Optional clean Tink; narration later | 2s / 3s | Panel says Live run; stage order is legible; a failed run is not paired with another run's result | C04, C05 |
| S04 | Complete the money path with explicit review | Exact ready candidate from S03; demo repo still clean | Open eye, pause on diagnosis/diff/rationale if present, click Apply, rerun `make break`, then run `git diff --stat` and `git diff` | Program prints `hello`; one expected unstaged edit is visible | Popover detail, then terminal; preserve click continuity | Click/system sound only | 2s / 3s per state | Apply is visibly chosen by the owner; successful rerun and unstaged diff are readable; no correctness superlative | C01, C05 |
| S05 | Demonstrate the local ordinary-clipboard no-op | App returned to watching; no active candidate | Copy neutral multi-line prose that is not error-shaped; wait through debounce; reopen popover | Receipt reads “Clipboard text was not error-shaped”; panel remains idle | Terminal or TextEdit source, then monitoring popover | Silence; narration later | 2s / 3s | Prose contains no path/error signature; no speculative state appears; only content-free receipt is shown | C02 |
| S06 | Prove dirty-worktree refusal | Fresh ready fixture candidate; popover closed; demo repo clean | Create `local-note.txt` in the dedicated repo, reopen the ready fix | Apply is disabled; “Review only — worktree changed”, Copy patch, Dismiss and expiry are readable | Terminal action followed by tight popover crop | Silence; narration later | 2s / 3s | Candidate is the same held fix; no Apply occurs; untracked file is removed only after the take | C05, C12 |
| S07 | Show deterministic judge replay without pretending it is live | Demo repo reset; no held fix; Settings open; model and replay control visible | Choose Replay configured fixture, then follow panel to the ready popover | Both panel/fix surfaces visibly say Fixture replay | Settings → panel → popover continuous take | Optional Tink; narration later | 2s / 3s | Model hop is the only substitution; replay label remains unobscured; no live-run or latency claim | C07 |
| S08 | Establish Sol's two inspectable roles | Clean browser profile on public README | Scroll from the two Sol roles to Sol ledger and a material commit with trailers | Session ID and public evidence are readable | Browser at delivery-size crop | Narration later | 2s / 2s each page | Only public repository data is visible; commit/ledger text matches current merged evidence | C08 |
| S09 | Disclose prior planning and new implementation | Public `prior-new-boundary.md` open | Show 12–13 July planning boundary, then open S0 commit `3422b0c` dated 14 July | New implementation start is legible | Browser detail | Narration later | 2s / 2s | Dates and commit match repository evidence; no claim that pre-period planning was new implementation | C09 |
| S10 | Close on availability and the human decision | Quiet monitoring footage from S01 | Hold the eye while restrained repository/release text fades in | Public repository and v0.1.0 platform line remain for at least 3s | Genuine app footage with simple text overlay | Narration close | 2s / 4s | URL, macOS floor and Apple Silicon qualification are exact; no Sites link appears | C01, C06, C10, C11 |

## Derived edit moments

These are not new product claims or synthetic footage:

- **E01 — Guided pipeline replay:** reuse S02–S04 at normal or slower playback
  with the verified `gate → resolve → admit → Sol → validate → review` caption.
- **E02 — Mechanical limitation:** hold the genuine fix-ready diff and add
  `Applicability ≠ correctness` without covering the Sol rationale or buttons.
- **E03 — Runtime/build provenance:** alternate genuine public README, ledger
  and commit views from S08; do not create a fake dashboard of evidence.

## Reset and rehearsal checklist

Run these only against the dedicated disposable demo repository:

1. If the directory is absent, create it with
   `scripts/make-demo-repo.sh /tmp/Premonition-Demo`.
2. Before each money-path take, confirm:
   `git -C /tmp/Premonition-Demo status --porcelain` is empty and
   `make -C /tmp/Premonition-Demo break` fails with the expected shallow
   traceback.
3. After an Apply take, inspect the unstaged diff, then restore the fixture with
   `git -C /tmp/Premonition-Demo restore .`.
4. Remove only the deliberate S06 file with
   `rm /tmp/Premonition-Demo/local-note.txt`; never use broad cleanup against
   an unverified path.
5. Dismiss or expire any held candidate before the next take. Confirm the app
   is watching and the panel has returned to Watching locally.
6. Keep fixture and live takes in separate named files. Never combine a live
   input with a fixture output or two different live runs.

## Recording-day privacy and quality checklist

- [ ] Verify the exact installed bundle and record its version/hash separately.
- [ ] Disable notifications, Focus banners and automatic updates for the take.
- [ ] Close mail, messages, password managers, account settings and unrelated
  development windows.
- [ ] Hide unrelated menu-bar items where practical while keeping the
  Premonition eye and any truthful offline indicator visible.
- [ ] Use a clean desktop and neutral wallpaper; remove personal filenames.
- [ ] Confirm `/tmp/Premonition-Demo` is the only repository shown.
- [ ] Confirm terminal prompt and browser chrome expose no personal data.
- [ ] Rehearse S02–S04 once before recording the real live take.
- [ ] Hold one to two seconds before each first action and after each result.
- [ ] Record a new take after a notification, hesitation, unclear hover or
  unreadable state.
- [ ] Name source files `S##_take##_live-or-fixture.mov` and preserve originals.
- [ ] Note whether every live take succeeded or failed; never discard that
  provenance when selecting footage.
- [ ] Inspect first and last frames of every selected take before editing.

## Capture blockers and next evidence

- No source footage exists yet.
- `ffmpeg` and `ffprobe` were not found during this planning pass. They are not
  needed for capture planning, but the editing/review stage needs an approved
  renderer or equivalent media-inspection tools.
- The final narration, captions and public YouTube URL remain owner-gated.
- The shot plan is ready for owner review; recording begins only after the
  script and staging choices are approved.
