# Premonition Build Week demo script — owner review draft

> **Planning artifact only.** This is a narration and edit contract for real
> Premonition footage. It does not authorise recording, video upload, YouTube
> publication or Devpost submission. Tom Ballard should rehearse and adjust the
> spoken wording so the final narration is his own delivery.

## Delivery contract

- **Surface:** Public YouTube video for OpenAI Build Week, Developer Tools.
- **Target duration:** 2:50; hard maximum 3:00.
- **Safety margin:** 10 seconds for encoding and platform rounding.
- **Delivery:** 1920 × 1080, 30 fps, H.264 video and AAC audio.
- **Footage:** Genuine signed Premonition v0.1.0 application footage only.
- **Narration:** Owner-recorded voiceover; no synthetic voice.
- **Music:** None. Retain the optional system Tink only if it is cleanly
  captured and does not compete with narration.
- **Captions:** Accurate English captions derived from the approved final
  narration; review at delivery size before upload.
- **Publication:** Separately owner-gated.

## Narrative spine

One visible transformation carries the film: a failing shallow Python fixture
becomes a reviewed, explicitly applied and successful local edit. Everything
else explains why that transformation is useful, bounded and credible.

The live model wait may be shortened in the edit only by visibly labelling the
playback rate. Do not claim a hero duration. If a live run does not produce a
valid candidate, keep the failure as evidence but record another take; never
splice its input into a different run's output.

## Timed narration

| Time | Picture | Owner narration | Required on-screen text |
| --- | --- | --- | --- |
| 0:00–0:08 | The monitoring dial scans around the eye; the menu-bar popover reads “Watching for errors”. | “Copy an error, and the fix is already waiting. Premonition is the ambient interface layer for Codex.” | `Premonition` / `Copy an error, and the fix is already waiting.` |
| 0:08–0:42 | Run the shallow failure, copy its traceback, show the live panel stages, open the ready fix, review, Apply, rerun successfully and show the unstaged diff. | “This Python program has a one-character configuration typo. I copy its traceback. Premonition recognises the error shape, resolves it to an allowlisted repository, then asks Codex, pinned to GPT-5.6 Sol, for one bounded patch. This is a live run; only the wait is shortened and labelled. When the eye changes, I open the candidate, review the diff, choose Apply, and rerun. The program succeeds; the edit stays unstaged.” | During any speed-up only: `Live run · 4× playback during model wait`. End: `Applied explicitly · unstaged edit` |
| 0:42–0:58 | Copy ordinary prose, then open the unchanged watching popover and its content-free ignored receipt. | “Copying ordinary prose looks deliberately uneventful. The deterministic gate rejects it locally; there is no model call. The receipt records only a content-free reason.” | `Ordinary clipboard → local gate drop → zero model calls` |
| 0:58–1:18 | Guided replay of the genuine live footage with restrained callouts on the panel and fix surface. | “Under the surface the order is fixed: gate, allowlisted repository, admission cap, read-only Sol speculation, canonical diff parsing, and git apply check. That last check proves only that the patch applies mechanically—not that it is correct.” | `gate → resolve → admit → Sol → validate → review` / `Applicability ≠ correctness` |
| 1:18–1:38 | Show a held fix after an untracked file is added: Apply disabled, “Review only — worktree changed”, Copy patch and Dismiss still present, expiry visible. | “Premonition never applies on its own. A clean worktree is required again when I click Apply. If I add an untracked file, Apply disables, while Copy Patch and Dismiss remain available. The candidate also expires after ten minutes.” | `Dirty worktree blocks Apply` / `Copy Patch and Dismiss remain available` |
| 1:38–1:58 | In Settings, show the pinned model and choose Replay configured fixture; follow the clearly labelled Fixture replay through the real panel and fix UI. | “For repeatable judging, Fixture Replay replaces only the model hop and is visibly labelled. It needs no network access; the real gate, resolver, admission, validator, review surface and human decision still run.” | `Fixture replay · model hop replaced · local pipeline remains real` |
| 1:58–2:24 | Clean public-repository views of the README, Sol ledger, BUILDLOG and one material commit's trailers. | “Sol has two roles here. At runtime, every real patch and rationale call is Codex pinned to GPT-5.6 Sol: ephemeral, read-only and no-approval. During Build Week, this same durable Sol session helped shape the specification, architecture, Swift implementation, tests, native design reviews and release evidence. I kept the scope, privacy, acceptance and publication decisions.” | `Sol: runtime engine + build partner` / `/feedback: 019f5f0f-a2dd-78e3-a5b3-413860708eab` |
| 2:24–2:39 | Show the dated prior/new boundary and the public S0 implementation commit. | “Planning began before the submission window; the repository dates that boundary. New application implementation starts on July fourteenth. MCP integration and a direct API executor are roadmap items, not features in this build.” | `Planning: 12–13 July · implementation: 14 July` / `MCP + direct API: roadmap only` |
| 2:39–2:50 | Return to the quiet eye and finish on the public repository/release links. | “Premonition is a signed, notarised macOS app for Apple Silicon. The source, release and full provenance trail are public. Copy an error. Review the fix. You decide.” | `github.com/tcballard/Premonition` / `Premonition v0.1.0 · macOS 14+ · Apple Silicon` |

## Claim and wording guardrails

- “Already waiting” is the product promise, not a guarantee for every copied
  error or a latency claim.
- Say **mechanically applicable**, never correct, secure or complete.
- Say the gate is deterministic and heuristic; do not imply generic error
  comprehension.
- Ordinary clipboard content stops locally in the supported tested path. Do
  not imply secret detection or redaction.
- An admitted copied error is sent verbatim to Codex. v0.1 does not redact it
  and does not control provider-side retention.
- Live footage must be labelled **Live run**. Fixture footage must remain
  visibly labelled **Fixture replay**.
- Fixture replay replaces only the model hop. Do not describe it as a live Sol
  call or use it to prove live model latency.
- Apply is always an explicit human choice and requires a literally clean
  worktree. Premonition never stages, commits, runs tests or invokes hooks.
- Describe Sol's build role only at the level supported by the public ledger,
  BUILDLOG, DEVLOG and commit trailers. Owner decisions remain owner decisions.
- Do not imply that MCP or a direct OpenAI API executor ships in v0.1.

## Edit notes

- Show the complete money path before the architectural replay.
- Use straight cuts and restrained 125–150% crops for menu-bar readability.
  Do not add decorative gradients, fake app chrome or generated interface
  footage.
- Preserve one or two seconds of stillness around every consequential click.
- If the live wait exceeds the time budget, accelerate only that continuous
  interval and keep both the `Live run` state and the playback-rate disclosure
  visible. Avoid a duration claim in narration or captions.
- Do not cover warnings, replay labels, dirty-worktree metadata or the expiry
  state with callouts.
- The final close may use a simple text overlay over genuine quiet-state
  footage; it must not look like a second product surface.

## Approval gates before capture or publication

- [ ] Owner approves or revises the narrative and spoken wording.
- [ ] Exact signed v0.1.0 installed bundle is re-verified before recording.
- [ ] Demo repository and app configuration are reset from the documented
  checklist.
- [ ] Live-run and fixture-run capture plans are rehearsed separately.
- [ ] Owner records the narration.
- [ ] Review export passes duration, audio, caption, privacy and claims QA.
- [ ] Owner separately approves public YouTube upload.
- [ ] Final public URL is added to the Launch Pack and Devpost draft.
