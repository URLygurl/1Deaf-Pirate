# House Rules — the baked-in canon

Every rule we've already written down across the two repos, pulled into one register, plus the
ones that are still only spoken. Each rule cites where it currently lives so you can trace it.

Legend: **[LAW]** = written down, enforced somewhere. **[SPOKEN]** = you say it, it isn't in any
file yet — candidates for promotion to LAW.

---

## 1. Posture — how we build

| # | Rule | Status | Source |
|---|---|---|---|
| 1.1 | **Build everything as if we might sell it this afternoon.** SaaS-ready by default: no personal paths, no one-off hacks, no "we'll productise it later". | **[SPOKEN]** | not in any file — see §12 |
| 1.2 | **Every project gets a repo.** No project lives only on a machine. | **[SPOKEN]** | not in any file — see §12 |
| 1.3 | **The repo is the source of truth**, not a machine. "If a machine dies, the whole project (and the shared memory of it) survives here." | [LAW] | `1Deaf-Pirate/README.md` |
| 1.4 | **Off-machine backup is a standing job.** `backup.sh` archives everything, and the script itself ends by shouting *"NOW MOVE IT OFF-MACHINE"*. | [LAW] | `1Deaf-Pirate/scripts/backup.sh` |
| 1.5 | **One source of truth. Decisions get logged. Feedback compounds.** | [LAW] | `1Deaf-Pirate/CLAUDE.md`, `docs/operating-map.md` |
| 1.6 | **The deliverable is the directory tree itself** where the product is a plugin/skill pack — no hidden build step. | [LAW] | `naked-app/agents/CLAUDE.md` |
| 1.7 | **Slow and staged over big-bang.** Nothing drastic, nothing sudden — improve "bit by little bit". | [LAW] | `naked-app/README.md` (task 1), `docs/architecture.md` |

## 2. Approval — HITL is absolute

| # | Rule | Status | Source |
|---|---|---|---|
| 2.1 | **Nothing happens without HITL approval. Full stop.** Agents "must never ever action anything without explicit approval" — you for build work, Cory for everything else. | [LAW] | `naked-app/README.md` (RULES) |
| 2.2 | **Double-HITL lock before any agent goes live.** Two locks per agent, tracked in its SOUL.md. | [LAW] | `CLAUDE.md`, `docs/architecture.md`, `agents/_template/SOUL.md`, `agent.config.yaml` |
| 2.3 | **Staged reveal.** Every agent starts `parked` → `staged` → `live`. DIME + NEIL reveal first. | [LAW] | `CLAUDE.md`, `agents/ROSTER.md`, `world/README.md` |
| 2.4 | **Protected actions route through an approval queue** — email, posts, spend. Agent runs save output for audit; they do **not** auto-apply. | [LAW] | `naked-app/Record-Label/MAESTRO_MISSION_BRIEF.md` |
| 2.5 | **Stop and ask before destructive or schema-breaking moves** — deleting data files even if they look like demo data; changing an agent's output schema. | [LAW] | `MAESTRO_MISSION_BRIEF.md` |
| 2.6 | **Agents report, humans decide.** Don't restart services, don't silently retry, don't re-encode, don't delete the source, don't push to a shared CDN without an explicit go-ahead. | [LAW] | `naked-app/agents/live.md`, `qc.md`, `delivery.md`, `encoder.md`, `probe.md` |
| 2.7 | **Ask one concise clarifying question rather than assume.** Architect asks before planning; HDR refuses to transcode on missing colour metadata. | [LAW] | `naked-app/agents/architect.md`, `hdr.md` |

## 3. Secrets & permissions

| # | Rule | Status | Source |
|---|---|---|---|
| 3.1 | **Secrets never get committed.** `.env` is gitignored; `.env.example` is the template. | [LAW] | `CLAUDE.md`, `.gitignore`, `.env.example` |
| 3.2 | **Never hardcode keys in source.** Tokens come from env, always — including in MCP config. | [LAW] | `.claude/.mcp.json`, `MAESTRO_MISSION_BRIEF.md` |
| 3.3 | **Tokens are compartmentalised / project-scoped**, not account-wide (e.g. `RAILWAY_API_TOKEN`). | [LAW] | `.env.example`, `docs/architecture.md` |
| 3.4 | **`.gitignore` blocks the whole class**, not just the file: `.env*`, `*.key`, `*.pem`, `**/secrets/*`. | [LAW] | `.gitignore` |
| 3.5 | **Permissions gate the shared brain. "One big brain with no walls is dangerous."** | [LAW] | `hive/README.md`, `hive/4-permissions/`, `docs/operating-map.md` |

## 4. Source truth — no confident lies

| # | Rule | Status | Source |
|---|---|---|---|
| 4.1 | **Source truth prevents confident lies.** Without it, agents stay confident liars. | [LAW] | `hive/README.md`, `docs/operating-map.md` |
| 4.2 | **Every claim must be backed by a real data source.** Never hallucinate facts, tracks, or connections. | [LAW] | `naked-app/Music-Recommnder/music-research-SKILL.md` |
| 4.3 | **Never invent track names.** If a track can't be verified against a real database, it doesn't go in the list. | [LAW] | `music-research-SKILL.md` |
| 4.4 | **Start with the canonical source, then fan out.** MusicBrainz for the canonical ID first, other sources second. | [LAW] | `music-research-SKILL.md` |
| 4.5 | **Full attribution on every connection**: publication, critic, date, URL. Cross-reference across sources where possible. | [LAW] | `music-research-SKILL.md` |
| 4.6 | **Hit the docs skill before quoting a flag.** `ffmpeg-docs`, `obs-docs`, `gstreamer-docs`, `mediamtx-docs`, `ndi-docs`, `otio-docs`, `ptz-docs`, `decklink-docs`, `audio-routing-docs` — "the anti-hallucination guardrail". | [LAW] | `naked-app/agents/CLAUDE.md` |
| 4.7 | **Ground decisions in real metadata. Never assume.** Probe first, plan second. | [LAW] | `naked-app/agents/architect.md` |

## 5. The HIVE — memory rules

| # | Rule | Source |
|---|---|---|
| 5.1 | **What one agent learns, all agents learn.** | `CLAUDE.md`, `hive/README.md` |
| 5.2 | **Capture is storage, not intelligence.** | `hive/README.md` |
| 5.3 | **Retrieval beats bigger memory.** Pull only what matters. | `hive/README.md` |
| 5.4 | **Every correction becomes a rule.** Repeated mistakes disappear. | `CLAUDE.md`, `hive/README.md` |
| 5.5 | **Agents should wake up smarter tomorrow.** | `hive/README.md` |
| 5.6 | **Memory is raw material; retrieval is the operating layer.** | `README.md`, `hive/README.md` |
| 5.7 | **The 6-question workflow audit before automating anything**: what sources? which wins on conflict? what context is always required? what context must never be used? what corrections repeat? how does a correction become a rule? | `docs/operating-map.md` |

## 6. File & folder rules

| # | Rule | Source |
|---|---|---|
| 6.1 | **Every agent is built from `agents/_template/`** — SOUL.md, SKILLS.md, `agent.config.yaml`, `tools.yaml`. Same shape every time. | `CLAUDE.md`, `agents/_template/README.md` |
| 6.2 | **Agents are data, not prose** — a ~15-line `agent.json` the runtime expands. | `platform/README.md` |
| 6.3 | **A skill folder is sealed.** Scripts must not import from other skills; copying the folder into another plugin must still work. *(This is the anti-aggregator rule in code form — no shared junk-drawer modules.)* | `naked-app/agents/CLAUDE.md` |
| 6.4 | **Cross-skill references go through `${CLAUDE_PLUGIN_ROOT}`**, never a hardcoded absolute path. | `naked-app/agents/CLAUDE.md` |
| 6.5 | **No absolute local paths anywhere** — no `/Users/…`, no `/home/…`. Use placeholders (`/tmp/input.mp4`, `~/Videos/`). | `naked-app/agents/CLAUDE.md` |
| 6.6 | **Never hardcode examples to one person's environment.** | `naked-app/agents/CLAUDE.md` |
| 6.7 | **SKILL.md body ≤ 500 lines.** Deep material moves to `references/<topic>.md` and loads on demand only. | `naked-app/agents/CLAUDE.md` |
| 6.8 | **`CLAUDE.md` stays under ~500 lines.** Link out to `docs/` for detail. | `1Deaf-Pirate/CLAUDE.md` |
| 6.9 | **No README.md inside a skill folder** (spec forbids). No `__pycache__` committed. | `naked-app/agents/CLAUDE.md` |
| 6.10 | **Skill `name` is kebab-case**, no `claude-` / `anthropic-` prefix (reserved). | `naked-app/agents/CLAUDE.md` |
| 6.11 | **Delete the scaffolder's placeholders** (`scripts/process.py`, `references/guide.md`) once real files land. | `naked-app/agents/CLAUDE.md` |
| 6.12 | **One file per persona**, bridging to that agent's SOUL.md. | `world/README.md`, `world/personas/README.md` |
| 6.13 | **Reference docs are option catalogues, not tutorials.** | `naked-app/agents/CLAUDE.md` |

## 7. Code & script standards

| # | Rule | Source |
|---|---|---|
| 7.1 | **Stdlib only. No pip dependencies.** Shell out to a CLI instead. | `naked-app/agents/CLAUDE.md` |
| 7.2 | **PEP 723 header on every script**, even when empty, so `uv run` works. | `naked-app/agents/CLAUDE.md` |
| 7.3 | **Every helper supports `--dry-run` and `--verbose`.** Missing `--dry-run` is a defect. | `naked-app/agents/CLAUDE.md` |
| 7.4 | **Print the exact shell command to stderr before running it.** Observability is not optional. | `naked-app/agents/CLAUDE.md` |
| 7.5 | **No `input()` anywhere.** Agents run non-interactive — the validator flags even the word in a docstring. | `naked-app/agents/CLAUDE.md` |
| 7.6 | **argparse subcommands, not mode flags**, once there are 3+ workflows. | `naked-app/agents/CLAUDE.md` |
| 7.7 | **Never run destructive commands** — no writing to the input path; confirm before any `-y` overwrite. | `naked-app/agents/encoder.md` |

## 8. Git & release

| # | Rule | Source |
|---|---|---|
| 8.1 | **`main` is the source-of-truth branch.** | `naked-app/agents/CLAUDE.md` |
| 8.2 | **Denied outright: `--amend`, `--no-verify`, force-push, hard-reset, clean.** Fix the underlying issue instead. | `naked-app/agents/CLAUDE.md` (`.claude/settings.json` deny-list) |
| 8.3 | **Commits name the thing they touched** — `skills/ffmpeg-hdr-color: fix zscale sandwich`. | `naked-app/agents/CLAUDE.md` |
| 8.4 | **Validate before commit, validate the whole suite before push.** Exit 1 = must fix. | `naked-app/agents/CLAUDE.md` |
| 8.5 | **Version lives in exactly one place** (`plugin.json`), never duplicated — the duplicate wins silently and bites you. Semver, tagged `v<M>.<m>.<p>`. | `naked-app/agents/CLAUDE.md` |

## 9. Agent design

| # | Rule | Source |
|---|---|---|
| 9.1 | **Open = you chat, you steer. Closed = they run, you get results.** Two types, one system. | `CLAUDE.md`, `docs/open-vs-closed.md` |
| 9.2 | **Hermes routes; Hermes does not do the work.** It dispatches and synthesises. | `CLAUDE.md`, `hermes/README.md` |
| 9.3 | **The orchestrator is the default entry point**, even though you can talk to a specialist directly. | `docs/open-vs-closed.md` |
| 9.4 | **Closed specialists get a scoped, locked toolset — nothing more.** Open ones get the broad toolbox. | `agents/_template/tools.yaml` |
| 9.5 | **Graduation gate (open → closed):** same shape of work 8+ times · predictable inputs · verifiable output · no mid-run back-and-forth · you catch yourself typing the same opening prompt. | `docs/graduation-path.md` |
| 9.6 | **Keep it open while** the work is exploratory, inputs are unpredictable, the answer depends on your taste, or the shape is still moving. | `docs/open-vs-closed.md` |
| 9.7 | **Cheap + fast model on closed work where it fits**; stronger model on interactive. | `docs/open-vs-closed.md`, `agent.config.yaml` |
| 9.8 | **One canonical roster.** ClickUp list "Squad team setup" (`901615266760`) wins — ignore "Squad Agents". | `agents/ROSTER.md` |
| 9.9 | **Agents don't do each other's jobs.** The architect designs and never encodes; probe inspects and never remuxes; QC reports and never re-encodes. | `naked-app/agents/*.md` |
| 9.10 | **Every specialist declares what it refuses.** SOUL.md has a "What they refuse" section, SKILLS.md has "Not for". | `agents/_template/SOUL.md`, `SKILLS.md` |

## 10. Licensing & commercial safety

| # | Rule | Source |
|---|---|---|
| 10.1 | **OSI-open + commercial-safe filter on every AI model.** Allowed: Apache-2, MIT, BSD, GPL. | `naked-app/agents/CLAUDE.md`, `Skills/workflow-ai-generation/SKILL.md` |
| 10.2 | **Always-dropped list — never recommend even if asked by name**: XTTS-v2, F5-TTS, FLUX-dev, SDXL/SD3 base, Stable Video Diffusion, Wav2Lip, SadTalker, Meta MusicGen, Surya OCR, CodeFormer, DAIN. | `naked-app/agents/CLAUDE.md` |
| 10.3 | **Every AI skill carries a `references/LICENSES.md`** enumerating what was dropped and why. Update it when the skill changes. | `naked-app/agents/CLAUDE.md` |
| 10.4 | **Flag company-size caps** (e.g. Tencent's 100M-MAU cap) before recommending at scale. | `Skills/media-sd/SKILL.md` |
| 10.5 | **Don't automate licensed SDK downloads in CI/CD** without confirming the licence. | `Skills/ndi-tools/SKILL.md` |

## 11. Design & brand

| # | Rule | Source |
|---|---|---|
| 11.1 | **Stay absolutely faithful to DESIGN.md and the naked-app UX structure.** | `naked-app/README.md` (RULES) |
| 11.2 | **Semantic tokens, never raw hex**, in component guidance. | `Skills/DESIGNmd site DS.md` |
| 11.3 | **Every component defines all seven states**: default, hover, focus-visible, active, disabled, loading, error. | `Skills/DESIGNmd site DS.md` |
| 11.4 | **No one-off spacing or typography exceptions.** No low-contrast text, no hidden focus indicators, no ambiguous labels. | `Skills/DESIGNmd site DS.md` |
| 11.5 | **Accessibility target WCAG 2.2 AA, keyboard-first, and every a11y rule must be testable.** | `Skills/DESIGNmd site DS.md` |
| 11.6 | **"Must" = non-negotiable, "should" = recommendation.** Language is the enforcement mechanism. | `Skills/DESIGNmd site DS.md` |
| 11.7 | **Default to SVG for every diagram** unless the user names another format. | `Skills/Diagram RouterSKILL.md` |
| 11.8 | **Brand green is `#7EFF00`**, paired with deep near-black. | `CLAUDE.md`, `world/brand/palette.md` |
| 11.9 | **Don't deviate from established component patterns without strong justification.** | `Company-in-a-box/DESIGN 3.md` |

## 12. Spoken but unwritten — promote these

These are rules you operate by that no file currently states. Drafted here so they can be
ratified into `CLAUDE.md` and enforced.

| # | Draft rule |
|---|---|
| 12.1 | **SaaS-ready by default.** Every project is built as if it could be sold this afternoon: no hardcoded tenant, no personal paths, config over constants, clean install path, README that a stranger can follow. (§6.5, §6.6 and §7 already enforce fragments of this — the principle itself isn't written.) |
| 12.2 | **Every project gets a repo.** Day one, before code. No project lives only on a machine. |
| 12.3 | **No aggregators.** *(Needs your definition — see the open question below.)* |
| 12.4 | **Every project ships with the standard doc set**: `CLAUDE.md`, `DESIGN.md`, `AGENT.md`, `SOUL.md` — currently listed as a Stage-2 task in the naked-app README, not as a rule. |
| 12.5 | **SEO/AEO/GEO is a build requirement, not a marketing afterthought** — every task must raise domain/brand visibility. Currently phrased as a task, not a standing rule. |

> **Open question — "no aggregators".** Nothing in either repo uses the word. Two readings both
> match rules we already have, and they'd be written differently:
> - **Research sense** — go to primary/canonical sources, never scrape aggregator sites. Already
>   half-baked in §4.2–4.5 (MusicBrainz first, every claim cited).
> - **Code sense** — no barrel/index re-export files, no shared junk-drawer modules. Already
>   half-baked in §6.3 (sealed skill folders, no cross-skill imports).
>
> Say which you meant and it gets written properly.

---

*Compiled from `1Deaf-Pirate` and `naked-app-muso-skills`. When a rule changes, change it here
and in its source file — one source of truth (§1.5).*
