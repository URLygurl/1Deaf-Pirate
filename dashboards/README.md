# dashboards — DeafPirates surfaces (staging)

Staging home for the dashboard/chat surfaces until the `deafpirate-dashboards` repo is
scaffolded. Visual rules: [`../docs/design.md`](../docs/design.md) · tokens:
[`../world/brand/tokens.css`](../world/brand/tokens.css).

| File | What | Conforms to design.md? |
|---|---|---|
| `floor-scaffold.html` | WYSIWYG floor editor (15 slots) + exporter — **source of truth** | ✅ |
| `studio-floor.html` | standalone wall-display floor (scaffold export) | ✅ |
| `deaf-pirates-hub.html` | orchestration hub — floor · comms feed · map/inventory | ✅ |
| `defpirate-chat-demo.html` | chat board — DIME routes, agents walk on & talk | ⚠️ **re-skin** (Peachy palette/Fraunces; animations good) |
| `peachy-animator.html` | animation tool (Peachy palette by design) | ⚠️ align if it becomes a product surface |
| `spriterig.html` | **sprite-sheet forge** — one character image → bg-strip → rigged 6-part puppet → animated frames → pixel pass → packed sheet + engine exports (Phaser/Aseprite/Unity/Godot/CSS). Feeds chat-board avatars. All local, zero deps. | ⚠️ purple/teal; re-skin to tokens if it becomes a product surface |
| `deafpirates-taskboard.html` | **Background Ops** — cron + tasks with time budgets | ✅ reference build |

`SESSION-LOG.md` — the original dashboard build log (assets, decisions, bugs-for-the-vault).

**Next:** re-skin the chat board to tokens.css (green=live, cyan=info; Oswald/Barlow/JetBrains
Mono), keep its walk-on/facetime/talk animations; wire avatars via `resolve-avatar.js`.
