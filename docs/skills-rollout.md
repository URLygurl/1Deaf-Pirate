# Skills rollout — one at a time, over days

The squad is already **wired and working** (DIME orchestrates, the board is live).
Skills are just extra tool-belts — install them whenever you have energy, in any
order, stop anytime. Nothing breaks if a specialist waits a week for its skills.

## How to do one

Each line installs **one specialist's** skills. Run it, watch the ✓'s, done:

```
bash scripts/assign-skills.sh <name>
```

- Each skill prints its name, then a ✓ (or ✗ skipped) lands when it finishes.
- It can't hang — anything heavy auto-skips after 5 min and the run moves on.
- A skipped one is fine; just run that specialist again another day to retry.

## The order — easiest first (fast wins), heavy last

Tick each off as you go. Top of the list = quick. Bottom = the slow downloads
(real coding CLIs, infra tools, the music model) — save those for a patient day.

**Quick (a few skills, light, usually fast):**
- [ ] `bash scripts/assign-skills.sh ozzy`        — 1 skill
- [ ] `bash scripts/assign-skills.sh dio`         — 1 skill
- [ ] `bash scripts/assign-skills.sh slash`       — 1 skill
- [ ] `bash scripts/assign-skills.sh angus`       — 3 skills
- [ ] `bash scripts/assign-skills.sh geddy`       — 4 skills
- [ ] `bash scripts/assign-skills.sh gigguide`    — 4 skills

**Medium (more skills, but each is light):**
- [ ] `bash scripts/assign-skills.sh nikki`       — 8 skills (content/social)
- [ ] `bash scripts/assign-skills.sh gene`        — 11 skills (finance/business)
- [ ] `bash scripts/assign-skills.sh randy`       — 11 skills (research)
- [ ] `bash scripts/assign-skills.sh halford`     — 6 skills (QA/security)

**Heavy (slow downloads — do these when you're not in a hurry):**
- [ ] `bash scripts/assign-skills.sh hetfield`    — docker (big)
- [ ] `bash scripts/assign-skills.sh lemmy`       — docker/modal/lambda (infra, big)
- [ ] `bash scripts/assign-skills.sh eddie`       — blackbox/grok/openhands (coding CLIs, slowest)

**Music toolkit (heavy — audiocraft is a real music model):**
- [ ] `hermes -p eddie skills install songwriting`
- [ ] `hermes -p eddie skills install heartmula`
- [ ] `hermes -p eddie skills install audiocraft`
- [ ] `hermes -p nikki skills install songwriting`
- [ ] `hermes -p nikki skills install heartmula`
- [ ] `hermes -p nikki skills install audiocraft`

**Already done:**
- [x] `neil` — deliberately no optional skills (no email/phone, exposed front desk)
- [x] `eddie` — blackbox, grok already installed in an earlier run (✓)

## Check what a specialist already has, any time

```
hermes -p gene skills list
```
