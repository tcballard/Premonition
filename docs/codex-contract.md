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
message passed `git apply --check` against the untouched generated fixture.

| Effort | Runs | Median seconds | Valid patches |
| --- | ---: | ---: | ---: |
| low | 5 | 48.32 | 0/5 |
| medium | 5 | 16.02 | 0/5 |
| high | 5 | 41.07 | 0/5 |

No runtime default is selected from these results. All measured outputs were
invalid, so the S0 contract/measurement criterion is recorded but the S1 entry
gate remains blocked pending a focused diagnosis of CLI instruction/skill
loading and diff output. Raw prompts and model outputs were not persisted.
