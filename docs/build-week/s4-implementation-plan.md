# S4 Rationale and Filmable Demo Plan

**Status:** Owner accepted; final provenance audit and draft PR preparation remain
**Issue:** #15 — S4: build rationale and filmable demo
**Branch:** `codex/issue-15-rationale-filmable-demo`
**Phase boundary:** S4 only

## Objective

Make Premonition's existing admitted, validated and human-controlled flow filmable live and through clearly labelled offline fixture replay. Preserve every S0-S3 runtime, privacy, Apply and provenance invariant.

## Existing seams

- `SpeculationPipeline.rationale` already uses pinned GPT-5.6 Sol at Low effort after final validation and treats failure as optional.
- `PresentationModel` already presents a validated fix before starting rationale and updates the held fix only if it is still current.
- `PipelineEvent` already exposes bounded executor lifecycle events.
- `FixtureExecutor` already loads the specified four-file fixture bundle and substitutes `{{REPO_ROOT}}`.
- `PremonitionConfiguration` already carries `surface_mode`, `sound_on_ready`, `fixture_path` and `fixture_speed` with safe defaults.
- `SettingsWindowController` provides the shared non-modal Settings owner required by the specification.

## Product architecture

### 1. Content-free demo stage model

Add an app-layer stage state containing only:

- current named stage;
- admitted start time;
- live or replay mode;
- replay-speed label where relevant;
- visibility preference.

The stage model must not retain clipboard text, prompts, diffs, rationale, model output or stderr.

Stage sequence:

1. Gate passed
2. Repository resolved
3. Sol reading files
4. Sol drafting patch
5. Validating
6. Applies cleanly

Live elapsed time is calculated from admission against the current clock. Replay event delays may be accelerated, but the panel must visibly say `Fixture replay` and show the configured replay speed.

### 2. Native demo panel

Add one AppKit-owned `NSPanel`:

- borderless, floating and shadowed;
- non-activating and never key-stealing;
- movable by its background;
- SwiftUI-hosted content;
- owned for the app lifetime;
- geometry-only persistence through the existing `panel_frame` state field.

The panel is available only when `surface_mode` is `demo`. Permanent mode remains cut-first and is not implemented unless all required S4 evidence is already complete.

### 3. Live event projection

Project deterministic pipeline milestones into the demo stage model without weakening or relocating the production pipeline:

- gate and resolver milestones are emitted after their existing successful guards;
- executor lifecycle maps to reading/drafting;
- validation starts before canonical validation and reaches `Applies cleanly` only after the existing validated outcome;
- rationale remains post-validation and does not delay or replace fix presentation.

### 4. Fixture replay

Add an explicit debug/demo replay entrypoint that:

- requires configured fixture mode and an existing fixture directory;
- loads through `FixtureExecutor`;
- substitutes the canonical generated demo repository root;
- sends the fixture error through the real gate, resolver, admission, parser, bounds validator and presentation path;
- replaces only the model hop with replayed events/final diff;
- performs zero Codex execution and records zero egress;
- visibly labels the panel and fix presentation as fixture replay.

Recording remains DEBUG-only, requires an explicit launch argument and visible fixture mode. If recording is not required to make A12 deterministic, defer the recorder and document the cut rather than adding a normal-operation persistence path.

### 5. Sound

Use only the system `Tink` sound when a validated fix becomes ready. Sound remains off by default and is controlled by the existing Settings toggle. No custom asset, continuous audio or sound on failure is introduced.

## Test plan

### A11 rationale independence

- Fix presentation occurs before rationale completion.
- Rationale timeout/failure leaves the held fix available.
- Code-shaped or excessive rationale remains reduced or absent under the existing validator.
- Rationale can never create a fourth model call or run before final validation.

### A12 offline replay

- Fixture replay calls no live executor and emits no egress verdict.
- Gate, repository resolution, admission, canonical diff parsing, bounds validation and presentation remain real.
- Replay timing honours acceleration while the UI is clearly labelled.
- The resulting fix retains normal Copy, Dismiss and clean-tree Apply behaviour.

### UI and accessibility

- Panel cannot become key and does not steal focus from the foreground app.
- Stage and elapsed-time changes have concise VoiceOver values without noisy per-tick announcements.
- Reduce Motion eliminates decorative transition motion without hiding state.
- Light/dark contrast and desktop density match the accepted authored popover.
- Settings exposes the demo-panel toggle and existing sound toggle without model controls.

## Verification

- Focused core and app tests.
- `swift test`.
- `scripts/test.sh`.
- `scripts/build-app.sh release`.
- `script/build_and_run.sh --verify`.
- Airplane-mode fixture replay with process/network evidence sufficient for A12.
- Installed-app owner review of panel placement, focus behaviour, live timing, replay label and sound.
- `python3 scripts/check_buildlog.py BUILDLOG.md --devlog DEVLOG.md`.
- `python3 scripts/check-provenance.py`.

## Explicit exclusions

- S5 release hardening, signing, notarisation and public packaging.
- S6 README/submission/Sites/publication work.
- Permanent panel mode unless required S4 work is already complete and the owner explicitly retains it.
- New model, prompt, executor or direct API behavior.
- Content-bearing normal-operation persistence.
- Auto-apply, staging, commits, post-apply commands or telemetry.

## Review gates

1. Core stage/replay contracts and privacy boundary.
2. Native panel ownership and non-activation.
3. Settings and sound behaviour.
4. A11/A12 deterministic evidence.
5. Installed visual/accessibility owner review.
6. Provenance-bearing draft PR; no merge without owner approval.

## Implementation checkpoint — 2026-07-18

- [x] Content-free ordered demo-stage model.
- [x] Honest live elapsed timer and explicit live/replay mode labels.
- [x] AppKit-owned borderless, floating, shadowed, movable, non-activating panel.
- [x] Geometry-only panel persistence.
- [x] Live gate/repository/executor/validation projection.
- [x] System Tink ready sound behind the existing off-by-default preference.
- [x] Local timed replay executor replacing only the model hop.
- [x] Bundled shallow fixture with optional `fixture_path` override.
- [x] Fix-ready replay label and Settings panel/replay controls.
- [x] Deterministic A11 and A12 coverage.
- [x] Full 51-test suite, repository wrapper, release build and developer launch.
- [x] Exact release installed with fixture resource and matching executable hash.
- [x] Owner visual/focus/timer/replay/sound review.
- [x] Airplane-mode installed replay observation.
- [ ] Final S4 log/ledger audit and draft PR.

DEBUG fixture recording is deferred. A12 is satisfied by the repository-authored deterministic fixture, so adding a content-bearing recording path would increase privacy risk without improving the required offline replay evidence.
