# platform — the Hermes runtime

The code that wires the 15 agents to Hermes. **Agents are data, not prose** — each one is a
~15-line `agent.json`; the runtime expands it into a full agent, registers it with the
orchestrator, and Hermes routes work to the right specialist.

## Run it

```bash
cd platform
npm install                       # one dependency: @anthropic-ai/sdk
export ANTHROPIC_API_KEY=...       # or put it in ../.env
npm run list                       # show the roster the runtime can see
npm run hermes "find me 3 venues for a Deadsound show in Austin"
```

Node 22+ runs the TypeScript directly (`--experimental-strip-types`) — no build step.

## Add an agent (the whole point)

Drop a folder under `agents/open/<NAME>/` or `agents/closed/<NAME>/` with one file:

```json
{
  "name": "NEIL", "legend": "Neil Peart", "type": "open",
  "role": "front-of-house / greeter",
  "voice": "warm, precise, a little philosophical",
  "owns": ["greeting", "intros", "onboarding"],
  "triggers": ["hello", "hi", "welcome", "who are you"],
  "skills": ["greet new arrivals", "explain the crew", "hand off to the right specialist"]
}
```

That's it. No SOUL.md, no SKILLS.md, no hours. (You *can* add a `SOUL.md` next to it for a
richer persona; the runtime will fold it in if present.)

## How a request flows

```
you → Hermes.route() → picks an agent from the registry (triggers, else LLM)
    → agent runs (claude-opus-4-8, streamed) with a prompt built from its agent.json + HIVE
    → result is logged to the HIVE (capture) → returned to you
```

## Files
- `src/llm.ts` — Anthropic client (opus-4-8, adaptive thinking, streaming)
- `src/registry.ts` — loads every `agent.json` under `../agents/`
- `src/prompt.ts` — builds an agent's system prompt from its config + shared HIVE context
- `src/router.ts` — picks the agent (keyword triggers first, LLM classifier fallback)
- `src/hive.ts` — shared memory: capture (append) + retrieve (recent)
- `src/hermes.ts` — the orchestrator: route → run → capture
- `src/index.ts` — CLI entry
