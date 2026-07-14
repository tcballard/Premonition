# Verified Codex CLI contract — S0

Verified 2026-07-14 on `codex-cli 0.144.2`.

```bash
codex --ask-for-approval never exec \
  --json \
  --sandbox read-only \
  --ephemeral \
  --ignore-user-config \
  --model gpt-5.6-sol \
  -c 'model_reasoning_effort="low"' \
  "<prompt>"
```

`--ask-for-approval` is a global option in this version and must precede
`exec`. `codex exec --ask-for-approval never` exits 2. The model ID and `low`,
`medium` and `high` reasoning-effort values were accepted by live ephemeral
calls. JSONL emitted `thread.started`, `turn.started`, `item.completed` with an
`agent_message`, and `turn.completed`; result extraction requires successful
turn completion and the final agent message.

An aggregate count of files under the Codex session store was 190 immediately
before and after a harmless ephemeral call. No historical session names or
contents were inspected.

## S0 shallow-fixture measurements

Five runs per effort, 120-second per-run bound; validity means the final agent
message passed the contract-correct normalisation and `git apply --check`
against the untouched generated fixture.
The first benchmark run reported low 0/5, medium 0/5 and high 0/5. That result
is retained as superseded evidence: the harness passed raw model text directly
to `git apply --check`, while Premonition's authoritative validator first strips
one surrounding Markdown fence. It also discarded every apply diagnostic, so
the result could not distinguish output-shape failures. This was a benchmark
validator defect, not evidence that Sol could not produce the fixture patch.

The corrected harness shares the single-fence contract and emits only safe
shape/reason enums in opt-in diagnostics. A plain medium-effort diagnostic
applied successfully; repeating it with the original temporary-path prefix
also applied, ruling out path-triggered skill routing as the cause.

Corrected five-run benchmark:

| Effort | Runs | Median seconds | Valid patches |
| --- | ---: | ---: | ---: |
| low | 5 | 20.73 | 5/5 |
| medium | 5 | 20.37 | 4/5 |
| high | 5 | 34.07 | 4/5 |

Selected defaults:

- initial speculation: `low` (5/5 validity and low latency);
- escalation: `medium` (verified higher effort than Low, equal observed validity
  to High and materially lower median latency than High);
- rationale: `low` (the lowest verified viable effort for a bounded prose role).

Every invocation remained explicitly pinned to `gpt-5.6-sol`; Luna and Terra
were not benchmarked because §13 makes Sol the only real v0.1 executor. Raw
prompts and model outputs were not persisted.
