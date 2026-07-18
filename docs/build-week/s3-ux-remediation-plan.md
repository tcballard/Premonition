# S3 UX Remediation Plan

**Status:** Owner accepted
**Branch:** `codex/issue-13-authored-popover`
**Phase:** S3 authored popover polish
**Owner review gate:** Required before issue #13 is completed or S4 begins

**Owner acceptance:** Confirmed 2026-07-18 for Dismiss, Copy Patch, keyboard traversal, Escape, and light/dark appearance.

## Objective

Resolve the three interaction defects verified in the installed Premonition app during the screenshot-based UX audit, then perform a short focused visual and accessibility verification before filming.

This remains presentation and native-interaction work inside S3. It does not change clipboard admission, repository resolution, the daily cap, Sol execution, validation, Apply safety, provenance, persistence, or any S4 demo behaviour.

## Verified defects

### 1. Dismiss leaves stale success state

After the user dismisses a held fix, the candidate is released but the monitoring receipt continues to say `Fix ready`.

**Remediation**

- Record a distinct content-free `Dismissed` terminal receipt before releasing the fix.
- Preserve the existing dismissed verdict and candidate-release behaviour.

**Acceptance**

- Dismiss does not modify the repository or clipboard.
- The held candidate is released.
- The monitoring receipt says `Dismissed`, not `Fix ready`.

### 2. Copy Patch overwrites its own feedback

Copy Patch first reports `Patch copied`, then the local watcher re-reads Premonition's own pasteboard write and replaces the receipt with `Clipboard text was not error-shaped`.

**Remediation**

- After Premonition writes the patch to the pasteboard, synchronise the watcher's handled change count.
- Ignore only that known local write; do not weaken filtering, deduplication, admission, or monitoring of later external clipboard changes.

**Acceptance**

- Copy Patch places the complete canonical diff on the pasteboard.
- The held candidate is released without repository mutation.
- `Patch copied` remains the visible receipt.
- The next genuinely external pasteboard change is still observed normally.

### 3. Fix-ready popover has no reliable keyboard focus

After opening the fix-ready popover and pressing Tab, the accessibility hierarchy reported no focused UI element.

**Remediation**

- Activate the accessory app and make the transient popover window key after presentation.
- Give Apply, Copy Patch, and Dismiss explicit focus positions and accessibility labels.
- Focus Apply initially when it is enabled; otherwise focus Copy Patch.
- Move focus away from Apply if a clean-worktree recheck disables it.
- Preserve Return for Apply and transient-popover Escape dismissal.

**Acceptance**

- The popover becomes key without changing its transient menu-bar behaviour.
- Tab and Shift-Tab traverse the three actions under the user's macOS Keyboard Navigation setting.
- Apply receives initial focus only when enabled; Copy Patch is the safe fallback.
- VoiceOver exposes unambiguous Apply, Copy Patch, and Dismiss actions.
- Escape closes the popover without implicitly dismissing the candidate.

## Implementation sequence

- [x] Confirm issue #13 branch, S3 boundary, current dirty worktree, specification, latest build-log entry, and settled invariants.
- [x] Implement distinct Dismiss receipt.
- [x] Implement narrow self-authored pasteboard suppression.
- [x] Complete key-window and SwiftUI focus behaviour.
- [x] Add focused regression and accessibility tests.
- [x] Run focused tests, `swift test`, `scripts/test.sh`, and the prescribed app-bundle verification.
- [x] Rebuild and reinstall the exact verified release bundle.
- [x] Confirm installed Apply focus through the accessibility hierarchy; retain the broader visual audit as an owner-review gate.
- [x] Append paired BUILDLOG/DEVLOG and Sol-ledger evidence.
- [x] Present for owner review without committing, publishing, merging, or starting S4.

## Files expected to change

- `Sources/PremonitionApp/PresentationModel.swift`
- `Sources/PremonitionApp/PasteboardWatcher.swift`
- `Sources/PremonitionApp/AppController.swift`
- `Sources/PremonitionApp/Strings.swift`
- `Sources/PremonitionApp/UI/FixReadyView.swift`
- `Tests/PremonitionAppTests/MonitoringPresentationTests.swift`
- `BUILDLOG.md`
- `DEVLOG.md`
- `docs/build-week/sol-ledger.md`

## Explicitly excluded

- S4 fixture/demo-panel implementation.
- New model calls, prompts, executors, telemetry, or persistence.
- Changes to gate, allowlist, cap, validation, Apply, or provenance contracts.
- Broader Settings redesign or first-run onboarding redesign.
- Sites, release, publication, submission, merge, or auto-merge work.
- Non-blocking aesthetic observations from the wider UX audit unless separately approved.

## Review order

1. Terminal receipt state transitions.
2. Pasteboard self-write boundary.
3. AppKit popover activation and SwiftUI focus ownership.
4. Regression coverage.
5. Installed-app visual and keyboard evidence.
