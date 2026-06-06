# Agent template

Copy this folder to `agents/open/<NAME>/` or `agents/closed/<NAME>/` to spin up an agent.

```
<NAME>/
├── SOUL.md            # identity & voice (Peachy Dossier → SOUL)
├── SKILLS.md          # capabilities (Peachy Dossier → SKILLS)
├── agent.config.yaml  # wiring: type, model, memory, reveal, routing
└── tools.yaml         # allowed tools / connectors
```

Build content with the **Peachy Dossier tool** (`agent-card-builder.html`), which exports
Squad avatars → SOUL.md / SKILLS.md.
