# Squad avatars — swappable by design

Avatars are **decoupled from the dashboards**. Nothing hardcodes an image. The
dashboards ask `resolve-avatar.js` for an agent's picture; it reads `avatars.json`.
Change the manifest (or drop a new file in `files/`) and **every surface updates** —
dashboard1, the chat board, anywhere.

You do **not** need final art to wire this up. Until an avatar is set, the agent shows
the brand fallback (the green skull), so the dashboards render right now.

## How to set or swap an avatar

Edit `avatars.json` → `agents.<NAME>.avatar`. Three accepted forms:

| Value | Meaning |
|------|---------|
| `null` | use the fallback (green skull) |
| `"LEMMY.png"` | a file in `files/` (resolved under `basePath`) |
| `"https://…/lemmy.png"` | any remote URL (CDN, storage bucket, etc.) |

Examples:
```jsonc
"LEMMY": { "avatar": "LEMMY.png",                 "alt": "LEMMY — A&R" },          // local drop-in
"DIME":  { "avatar": "https://cdn.example/dime.webp", "alt": "DIME — orchestrator" } // hosted
```

To **change** an avatar later, just point it at a new file/URL — no code changes, no
redeploy of the resolver. That's the whole point: you'll swap these from time to time.

## Drop-in folder

Put image files in `world/brand/avatars/files/`. Suggested convention: one per agent,
named by agent (`DIME.png`, `LEMMY.png`, …), square, ~512×512, transparent PNG or WEBP.
Any size works; the dashboards style them.

## Wiring (for whoever builds the dashboard surface)

```js
import manifest from '/world/brand/avatars/avatars.json' assert { type: 'json' };
import { resolveAvatar } from '/world/brand/avatars/resolve-avatar.js';

const { src, alt, isFallback } = resolveAvatar('NIKKI', manifest);
// → <img src={src} alt={alt} class={isFallback ? 'avatar avatar--placeholder' : 'avatar'} />
```

`resolveAll(manifest)` returns the whole squad at once. Pass `{ rootPrefix }` if the app
serves assets from a different base path.

## Note on artwork

This system is asset-agnostic — it shows whatever images you approve and drop in, and
nothing here generates art. (I can't help produce images of children using cigarettes or
alcohol, but the personas are adult rock legends anyway, and the slots take any art you
choose — including placeholders now, final art later.)
