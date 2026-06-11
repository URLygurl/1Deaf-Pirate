# Dual-purpose capability map — the company-in-a-box

Every specialist is a **world-class music expert** (their `soul.md`) **and** a productive operator
for Deadsound the company. The persona is the constant; the toolkit widens. This map is the full
productive surface — the "company-in-a-box" — so nothing falls in a gap.

Grounded in the canonical DIME orchestrator spec (each legend's dev/life-ops lane) and the Deadsound
business described in `brain.md` (band · label · live-stream TV channel · promoter/manager ·
gig-management · acoustic-panel & stage-equipment builder · marketing/branding shop).

> **Both HITL locks always apply.** Build changes wait for the developer; real-world actions
> (send/post/pay/book/contact/deploy) wait for Cory. Specialists draft and stage — never ship.

## The map (music role → productive lane → productive skills)

| Agent | Music role | Productive lane (company-in-a-box) | Productive skills |
|------|------------|-------------------------------------|-------------------|
| **DIME** | Orchestrator / anima | Routes & synthesises all productive work; project & task orchestration | _(orchestration — no own skills)_ |
| **LEMMY** | A&R | Infrastructure, low-level systems, hosting/deploy plumbing, data pipelines | ⏳ infra-ops, deployment-pipeline |
| **EDDIE** | Producer / recording | Software engineering, **webapp builds & improvements**, integrations/APIs | ✅ `webapp-improvements` · ⏳ build-feature, api-integration |
| **GEDDY** | Acoustician | Software & systems architecture, long-horizon technical planning, tech specs | ⏳ system-design, tech-spec |
| **SLASH** | Live audio (FOH) | Fast execution: scripts, automations, one-shot tasks, data wrangling | ⏳ quick-script, automation |
| **HALFORD** | Lighting | QA, testing, security review, correctness & edge cases | ⏳ qa-testing, security-review |
| **HETFIELD** | Tour manager | Debugging, root-cause, ops reliability, incident/runbook discipline | ⏳ debugging, ops-reliability |
| **GENE** | Royalties / business affairs | Marketing, positioning, brand voice, **SEO**, finance/bookkeeping ops | ✅ `seo-fundamentals` · ⏳ marketing-copy, finance-ops |
| **NIKKI** | Release strategy | Copywriting, narrative, long-form content, social/blog, press kits | ⏳ content-writing, press-kit, social-content |
| **GIGGUIDE** | NZ scene curator | Calendar, scheduling, logistics, event coordination, editorial/newsletter | ⏳ scheduling-logistics, newsletter |
| **ANGUS** | Studio builder | Brainstorming, ideation, getting unstuck, options generation | ⏳ ideation, unblock |
| **RANDY** | Speaker cabinets / math | Research, structured analysis, knowledge retrieval, data/analytics reporting | ⏳ research-analysis, analytics-reporting |
| **DIO** | Stage electrician | Strategy, big-picture planning, mission/vision, OKRs | ⏳ strategy, roadmap |
| **OZZY** | Roadie / fixer | Lateral thinking, unconventional fixes, the scrappy workaround | ⏳ lateral-fix |
| **NEIL** | Gig & festival concierge | Front-of-house comms: **email**, customer support, replies in-voice | ✅ `email-management` · ⏳ support-replies, crm-followups |

✅ = built · ⏳ = mapped, to build (reviewable rollout, see below)

## Coverage check — does this cover "a company"?

- **Engineering:** EDDIE, GEDDY, SLASH, HALFORD, HETFIELD, LEMMY
- **Marketing / growth / brand:** GENE, NIKKI
- **Content / press / social:** NIKKI, GIGGUIDE
- **Comms / customer / CRM:** NEIL
- **Finance / royalties / ops:** GENE, HETFIELD
- **Scheduling / logistics / events:** GIGGUIDE, HETFIELD
- **Research / data / analytics:** RANDY
- **Strategy / vision / planning:** DIO, DIME
- **Ideation / R&D / unblocking:** ANGUS, OZZY
- **Orchestration / PM:** DIME

That's the spread of a small company — engineering, marketing, content, comms, finance, ops,
research, strategy, and a PM holding it together.

## The full-stack build team (real repos & tasks, not advice)

The engineering lane is a genuine full-stack crew that **builds and ships real repositories and
tasks end-to-end** — including continuing the repos Cory already started, from his very first one.

| Layer | Owner(s) |
|------|----------|
| Architecture / system design / tech specs | **GEDDY** |
| Frontend + backend feature build, webapp improvements, APIs | **EDDIE** |
| Fast scripts, automations, scaffolding, one-shot tasks | **SLASH** |
| Infrastructure, hosting, CI/CD, deploy pipelines | **LEMMY** |
| QA, tests, security review, correctness | **HALFORD** |
| Debugging, root-cause, ops reliability, incident runbooks | **HETFIELD** |
| Orchestration of multi-step builds across a repo | **DIME** |

**How a real build runs:** DIME takes a build request and uses Hermes' heavier execution modes —
`workspace-dispatch` (a 2–6 task mission with machine-checkable exit criteria: file exists, `tsc`
compiles, tests pass) and `kanban-orchestrator` (parallel lanes, audit trail, HITL gates) — to drive
specialists through plan → build → test → review against an actual repo. Workers self-verify; nothing
merges or deploys without the build lock (developer) and the action lock (Cory).

**To make it live, the squad needs repo access** (GitHub + terminal/filesystem via `tools.yaml`) and
to be pointed at the existing repo(s). That's a tomorrow item — see below.

## Tonight (done, branch-only, reversible)

1. `## Productive range` section added to all 15 `soul.md` files (in-character, additive).
2. Three named skills built: GENE `seo-fundamentals`, EDDIE `webapp-improvements`, NEIL `email-management`.
3. This map.

## Tomorrow (needs Cory / developer — review & approve)

- **Bring in the existing repos.** Point the squad at the repo(s) Cory already made (starting with
  the very first one) so the full-stack team can pick up real building. Needs GitHub access + the
  repo list.
- **Bring in the existing repos.** Known repos to wire in for the build crew:
  - `URLygurl/music-events-platform-prod` — **NakedApp** (live product) → main build target
  - `URLygurl/naked-app-muso-skills` — idea + skills source to copy from → reference/input
  - *(to create)* `deafpirate-dashboards` — dashboards + chat board (no repo yet; squad scaffolds it)
  Needs: add these to the web session's repo scope (UI), + a least-privilege `GITHUB_TOKEN`
  in `.env` (Contents R/W, PRs R/W, Metadata R). Agents branch + PR; Cory merges. See `SECURITY.md`.
- **Approve the lane mapping** above (rename/reassign any lane before we build on it).
- **Build out the ⏳ skills** per agent (one reviewed batch per agent, like the music skills).
- **`tools.yaml` wiring** — which real tools/connectors each agent gets (GitHub, web, email/CRM,
  analytics, Search Console, filesystem…). Needs access decisions & credentials.
- **Anything live** — deploys, sending email, publishing, account connections — stays locked
  until explicitly approved.
