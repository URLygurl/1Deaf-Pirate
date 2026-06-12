# 01 · System Map

*What's running, where, and how it connects. Updated 2026-06-12.*

> Secrets (IP, entrance path, passwords, keys) are **not** here — they live in the
> DO panel / `.env`. This is the shape, not the credentials.

## The host
- **DigitalOcean Droplet** `pirates-s-1vcpu-2gb-syd1` — Ubuntu 24.04, **1 vCPU /
  2 GB**, region SYD1. Public IP + console: DO panel.
- Reached today via the **DO web console** (browser terminal). SSH not yet set up.
- Model = **Claude via the Anthropic API** (no local GPU on this box).

## The stack on the box
```
DigitalOcean Droplet (Ubuntu)
│
├─ Hermes CLI .................. the engine that runs the squad
│   ├─ profiles/ (~/.hermes/profiles/) ... 15 squad + 4 org-chart
│   ├─ hermes-gateway.service ........... systemd USER service (linger on);
│   │                                      hosts the dispatcher, sweeps Kanban ~60s.
│   │                                      No messaging channels enabled yet.
│   ├─ Kanban board (~/.hermes/kanban.db) . DIME = orchestrator_profile;
│   │                                       auto_decompose + dispatch_in_gateway on.
│   ├─ HIVE / shared brain ............... "what one learns, all learn"
│   └─ Web dashboard ..................... http://127.0.0.1:9119  (localhost only)
│
├─ 1Panel ...................... server control panel, web UI on :14204
│                                (Docker, reverse proxy, app store) — the cockpit
│
└─ ~/1Deaf-Pirate (git repo) ... source of truth for definitions, docs, scripts
```

## How a request flows
```
You → DIME (orchestrator) → routes → specialist profile runs → HIVE (capture)
    → DIME synthesises → one answer back to you
```
Triggers can also arrive as **Kanban cards** (manual or scheduled) → dispatcher
picks them up → DIME fans out.

## The two locks (govern everything)
- **Build lock** → changes to *how the squad is built* wait for **Vanessa** (dev/admin).
- **Action lock** → real-world actions (send/post/pay/book/contact/deploy) wait for
  the **client**. Vanessa overrides both. **Drafted ≠ done.**

## Known constraints
- 2 GB box is snug with Hermes + 1Panel + Docker. Bump to 4 GB before piling on apps.
- Dashboard binds to `127.0.0.1` → not viewable off-box without a proxy (see runbook).
- No DO Cloud Firewall set yet; ufw inactive. Hardening = `docs/pre-launch-checklist.md`.
