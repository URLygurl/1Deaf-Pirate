# Who gets what — optional skills per specialist

The **optional** Hermes skills each profile installs, mapped from
`docs/hermes-skills-map.md` and installed by `scripts/assign-skills.sh`.

> The ~73 **bundled** skills already ship in every profile — this list is only the
> *optional* add-ons. Ordered easiest → heaviest so you can see where install time
> goes. Counts match `docs/skills-rollout.md`.

## How install works (and why it's safe)
Each install is **quarantined → security-scanned → confirmed (`y`)** before it
touches a profile. Official Nous skills may scan **DANGEROUS** but are **ALLOWED**
because they're builtin/official — that's expected (see `SECURITY.md`). Run one at
a time so you see each scan:
```
hermes -p <name> skills install <id>
hermes -p <name> skills list        # what a profile already has
hermes skills browse                # the real catalogue of installable ids
```

---

## 🟢 Quick (light, fast)
| Profile | Skills | # |
|---|---|---|
| **ozzy** | `darwinian-evolver` | 1 |
| **dio** | `creative-ideation` | 1 |
| **slash** | `watchers` | 1 |
| **angus** | `creative-ideation`, `idea-validation`, `darwinian-evolver` | 3 |
| **geddy** | `code-wiki`, `architecture-diagram`, `concept-diagrams`, `subagent-driven-development` | 4 |
| **gigguide** | `google-workspace`, `maps`, `airtable`, `notion` | 4 |

## 🟡 Medium
| Profile | Skills | # |
|---|---|---|
| **halford** | `web-pentest`, `sherlock`, `domain-intel`, `oss-forensics`, `1password`, `github-code-review` | 6 |
| **nikki** | `humanize-text`, `meme-generation`, `baoyu-article-illustrator`, `hyperframes`, `youtube-content`, `xurl`, `manim`, `p5js` | 8 |
| **gene** | `3-statement-model`, `dcf-model`, `lbo-model`, `merger-model`, `comps-analysis`, `excel-author`, `pptx-author`, `stocks`, `shopify`, `shop-app`, `seo-fundamentals` | 11 |
| **randy** | `arxiv`, `duckduckgo-search`, `searxng-search`, `osint-investigation`, `domain-intel`, `scrapling`, `parallel-cli`, `qmd`, `polymarket`, `blogwatcher`, `llm-wiki` | 11 |

## 🔴 Heavy (slow downloads — clones / deps)
| Profile | Skills | # |
|---|---|---|
| **hetfield** | `docker-management` | 1 |
| **lemmy** | `docker-management`, `pinggy-tunnel`, `hermes-s6-container-supervision`, `modal`, `lambda-labs` | 5 |
| **eddie** | `blackbox`, `grok`, `openhands`, `code-wiki`, `rest-graphql-debug`, `subagent-driven-development` | 6 |

## 🎵 Music toolkit (heavy — real MusicGen model)
| Profile | Skills |
|---|---|
| **eddie** & **nikki** | `songwriting`, `heartmula`, `audiocraft` |

## Deliberately none
- **neil** — exposed front desk; **no outbound-send tools** by design (no email/phone).
- **dime** — orchestrator; uses bundled `kanban-orchestrator` + our `orchestrate`
  skill (not installed via this script).

---

## ⚠️ Unverified ids
These ids come from the skills-map, **not** confirmed against your live catalogue.
If an install errors with `unknown skill` (vs just being slow), the id is off —
cross-check against `hermes skills browse` and fix it in `scripts/assign-skills.sh`
+ this doc.
