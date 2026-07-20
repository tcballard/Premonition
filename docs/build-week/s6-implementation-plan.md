# S6 Submission Materials Plan

**Status:** Active — evidence spine initialised; owner decisions and deliverables pending

**Issue:** #24 — S6: assemble submission materials and owner handoff

**Branch:** `codex/issue-24-readme-provenance`

**Phase boundary:** S6 only

## Objective

Turn the completed, signed Premonition v0.1 build and its provenance into a concise Build Week submission package that judges can understand and test without rebuilding. Prepare everything for owner approval while keeping publication and submission as separate manual decisions.

## Verified live constraints

Checked against the official [Build Week rules](https://openai.devpost.com/rules), [FAQ](https://openai.devpost.com/details/faqs) and [OpenAI event page](https://openai.com/build-week/) on 2026-07-20:

- Deadline: 2026-07-21 17:00 PDT / 2026-07-22 01:00 BST.
- Track: one category only; Premonition uses **Developer Tools**.
- Required: project description, public YouTube demo, repository URL and primary `/feedback` Codex Session ID.
- Video: three minutes or under, publicly visible on YouTube, narrated with audio, and must explain the product, Codex use and GPT-5.6 use.
- Repository: public with relevant licence, or private and shared with `testing@devpost.com` and `build-week-event@openai.com`.
- Developer tools need installation instructions, supported platforms and a judge testing path that does not require rebuilding.
- Existing work must distinguish pre-period planning from meaningful Codex/GPT-5.6 work during the Submission Period.
- No submission changes after the deadline.

## Workstreams and order

### 1. Evidence and claims spine

- Maintain one release identity, availability state, claims ledger, asset inventory and channel matrix under `launch-pack/`.
- Permit only verified or visibly qualified claims.
- Keep correctness, secret-redaction, retention, autonomy and public-availability overclaims out of every output.

### 2. Repository and provenance front door

- Replace the README's stale signed-artifact status with current, qualified availability copy.
- Verify the dated prior/new boundary and commit links against Git history.
- Keep the Sol runtime/build-partner distinction concise and point to inspectable evidence.
- Preserve installation, fixture replay, privacy and testing instructions.

### 3. Submission narrative and form draft

- Draft the Developer Tools description, mechanism, limitations, Codex workflow, GPT-5.6 integration and pre-existing-planning disclosure.
- Record unknown Devpost fields as owner-side blockers rather than guessing.
- Connect feedback ID `019f5f0f-a2dd-78e3-a5b3-413860708eab` to the ledger and narrative.

### 4. Under-three-minute demo

- Use the Toolkit `product-demo` workflow against the signed installed app and deterministic fixture repository.
- Produce a timed script, shot list, narration, captions and verification checklist before recording.
- Required beats: ordinary clipboard no-op; admitted traceback; gate/repository/Sol/validation loop; review before Apply; dirty-tree safety; offline fixture replay; Sol as runtime and build partner.
- Do not show private notifications, unrelated repositories, secrets, unlicensed music or generated UI as product evidence.

### 5. Owner access decisions

Resolve one at a time:

1. [x] public MIT repository at `https://github.com/tcballard/Premonition`;
2. [x] public signed judge download at `https://github.com/tcballard/Premonition/releases/tag/v0.1.0`;
3. public YouTube upload authority;
4. whether the owner-only Sites explainer is included, omitted or later made public;
5. final Devpost submission authority.

### 6. Final audit and handoff

- Run the Launch Pack structural checker throughout and `--final` only after all blockers are resolved or deliberately removed.
- Verify every cited link and finished asset.
- Record ready, qualified, blocked, removed, omitted and not-applicable surfaces.
- Present the complete pack for explicit owner approval before any public action.

## Explicit stop gates

- The owner authorised and the session verified the public GitHub `v0.1.0` release. Do not publish another release or asset, make a video public, expand Sites access, publish Homebrew, change repository visibility, submit Devpost or promote externally without separate owner authority.
- Do not add runtime/UI polish unless a submission-blocking product defect is separately evidenced and approved.
- Do not fabricate form fields, dates, metrics, links, test states or access states.

## Completion checklist

- [x] S6 issue and branch established from merged S5 main.
- [x] Official current submission constraints verified.
- [x] Initial launch brief, claims ledger, inventory, channel matrix, checklist and handoff created.
- [x] README current status and dated boundary verified.
- [ ] Submission narrative and known form fields complete.
- [ ] Timed demo script, shot list and captions plan complete.
- [ ] Real footage captured and final public-YouTube candidate technically verified.
- [x] Repository and signed-download routes owner-approved and verified.
- [ ] Video and optional Sites routes owner-approved.
- [ ] Launch Pack final validation passes.
- [ ] BUILDLOG, DEVLOG and Sol ledger contain final S6 evidence.
- [ ] Owner gives final approval before publication or submission.
