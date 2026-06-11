# Hermes skills map — DeafPirates crew → real Hermes skills

**The finding:** Hermes ships ~170 skills (73 bundled + 97 optional) + 17 plugins + the gateway +
MCPs that cover *most* of the squad's productive lanes — **and the music side.** So we mostly
**enable/assign** real, maintained skills rather than build new ones.

- **Bundled** skills are already synced into every profile and auto-load by description.
- **Optional** skills install per profile: `hermes -p <name> skills install <id>` (browse with `hermes skills browse`).

## Per-specialist mapping (music identity → productive lane → real Hermes skills)

### Engineering
- **EDDIE** — producer → code/webapp/APIs → *bundled:* `claude-code`, `codex`, `opencode` (delegate to coding-agent CLIs), `python-debug`, `node-inspect-debug`, `tdd`, `root-cause-debugging`, `pre-commit-review`, `code-review`. *optional:* `blackbox`, `grok`, `openhands`, `code-wiki`, `rest-graphql-debug`, `subagent-driven-development`.
- **GEDDY** — acoustician → architecture/planning → `plan`, `code-wiki`, `architecture-diagram`, `concept-diagrams`, `subagent-driven-development`.
- **SLASH** — FOH → fast scripts/automation → coding skills + `watchers` (poll RSS/API/GitHub) + n8n MCP.
- **HALFORD** — lighting → QA/security → `tdd`, `pre-commit-review`, `dogfood`; security: `web-pentest`, `sherlock`, `domain-intel`, `oss-forensics`, `1password`, `github-code-review`.
- **HETFIELD** — tour mgr → debug/ops → `root-cause-debugging`, `python-debug`, `node-inspect-debug`, `docker-management`, observability plugin.
- **LEMMY** — A&R → infra/hosting/deploy → `docker-management`, `pinggy-tunnel`, `hermes-s6-container-supervision`, `modal`, `lambda-labs`.

### Business / content
- **GENE** — royalties/business → finance/marketing → *finance powerhouse:* `3-statement-model`, `dcf-model`, `lbo-model`, `merger-model`, `comps-analysis`, `excel-author`, `pptx-author`, `stocks`; + `shopify`/`shop-app`; + our `seo-fundamentals`.
- **NIKKI** — release strategy → copy/content/social → `humanize-text` (strip AI-isms), `meme-generation`, `baoyu-article-illustrator`, `hyperframes` (video/social overlays), `youtube-content`, `xurl` (X/Twitter), `manim`, `p5js`; + our content skills.
- **NEIL** — concierge / **the exposed front desk (bidirectional public layer)** → **deliberately holds NO outbound-send tools. No email, no phone.** He's the one agent facing the outside world, so he gets nothing to send/call with — if he's ever manipulated at the front, there's no `agentmail`/`telephony`/Gmail for an attacker to fire. **NEIL drafts and triages; the actual send/call is held at the action-lock** (or routed to a gated *internal* sender later — Vanessa's call). The comms toolkit (`email`/himalaya, `agentmail`, `google-workspace` Gmail, `telephony`/Twilio) exists in Hermes but lives **behind the line**, never on the exposed profile.
- **GIGGUIDE** — scene curator → calendar/scheduling → `google-workspace` (Calendar), `maps` (routes/timezones), `airtable`, `notion`.

### Strategy / research / creative
- **DIO** — stage electrician → strategy/vision → `plan`, `creative-ideation`, research suite.
- **RANDY** — cabinets/math → research/analytics → `arxiv`, `duckduckgo-search`, `searxng-search`, `osint-investigation`, `domain-intel`, `scrapling`, `parallel-cli`, `qmd`, `polymarket`, `blogwatcher`, `llm-wiki`.
- **ANGUS** — studio builder → ideation/unblock → `creative-ideation`, `idea-validation`, `darwinian-evolver`.
- **OZZY** — roadie/fixer → lateral/unconventional → `darwinian-evolver`, throwaway experiments.

### Orchestrator
- **DIME** — `kanban-orchestrator` (bundled) + our `orchestrate` skill.

## Music side — the squad's actual specialty has real tools too
- `songwriting` (Suno prompts) · `heartmula` / `audiocraft` (MusicGen — actual song generation) ·
  audio spectrograms/features · plus the creative HTML skills for press kits + visuals.
- So the music expertise isn't just persona — the crew can literally **write and generate music**.

## Squad-wide layers (the "tons more")
- **memory** plugin + `honcho` skill = the shared brain (gbrain). Already on; honcho adds richer
  cross-session, multi-profile user modelling.
- **gateway** = DIME on Telegram / Discord / Slack / WhatsApp / Signal / Email / SMS (phone access).
- **kanban** plugin + dispatcher = the orchestration board (the connective tissue to switch on).
- **MCPs:** `linear` (project mgmt), `n8n` (automation workflows).

## What this means
Far less building than feared. The plan:
1. **Enable/install** the mapped skills per specialist (mostly one-line installs).
2. **Wire orchestration** — kanban board + dispatcher (gateway) + DIME as orchestrator.
3. **Later:** gateway for phone access, `honcho` for richer memory.
