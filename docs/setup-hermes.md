# Setup Hermes — The Dumb Doc (your part)

Plain steps to get Hermes alive on Lightning, up to the point where **you hand it to
me and I attach the squad.** Don't do anything fancy — we just want one clean chat
working first. Tick the boxes as you go.

**Golden rule:** if Hermes can't hold a normal chat yet, don't add anything else.
One clean conversation first. Everything else comes after.

---

## What you'll have at the end
A Hermes that chats on your Lightning box, with our squad's files sitting next to it
— ready for me to turn into DIME, NEIL, and the rest.

---

## Step 1 — Make the box (Lightning Studio) 🖥️
- [ ] Log in to **Lightning AI**.
- [ ] Create a new **Studio** (this is your cloud computer). A GPU one is fine —
      we'll use the GPU later; not needed for first chat.
- [ ] Open the Studio's **Terminal** (that's where you type the commands below).

*A Studio is just a Linux computer in the cloud. Every command below is typed into
its terminal.*

## Step 2 — Install Hermes ⚙️
Paste this one line into the terminal and press Enter:
```bash
curl -fsSL https://hermes-agent.nousresearch.com/install.sh | bash
```
*Careful mode (optional, per `SECURITY.md`): preview it first —*
`curl -fsSL https://hermes-agent.nousresearch.com/install.sh | less` *— skim it, then run the line above.*

Then reload the shell:
```bash
source ~/.bashrc
```
- [ ] Done when it finishes with no big red errors.

## Step 3 — Give it a brain (Claude only, for now) 🧠
We're booting **Claude-only** first — prove it behaves, *then* add others. Run:
```bash
hermes model
```
Pick **Anthropic / Claude** and paste your **`ANTHROPIC_API_KEY`** when prompted.
That's the **only key you need right now** — the whole stack defaults to Claude
(`claude-opus-4-8`), so nothing breaks without Gemini/Kimi/etc.
*(Alternative for a quick hosted test only: `hermes setup --portal`. We're skipping it — Claude first.)*
- [ ] Done when it says your provider is **Anthropic / Claude**.

## Step 4 — Prove it chats 💬
```bash
hermes --tui
```
Type something simple, like:
```
Say hello and tell me what model you are.
```
- [ ] Done when it **replies normally** and you can send a second message.

👉 If it doesn't reply: run `hermes doctor`, then `hermes model` again. That fixes
most things.

## Step 5 — Prove it remembers 🔁
Close it (Ctrl+C), then:
```bash
hermes --continue
```
- [ ] Done when it brings back the chat you just had.

## Step 6 — Put the squad's files on the box 📦
Bring our repo onto the Studio so the skills and plans are right there:
```bash
git clone https://github.com/URLygurl/1Deaf-Pirate.git
cd 1Deaf-Pirate
git checkout claude/hermes-agent-plugins-4FrT9
```
- [ ] Done when you can run `ls` and see folders like `agents/`, `docs/`, `hive/`.

---

## Step 7 — Hand it to me 🤝
Tell me these three things and I'll take over:
1. ✅ "Hermes chats" (Step 4 worked)
2. ✅ "Repo is cloned" (Step 6 worked)
3. **How you want me to drive it:** either
   - you **paste me the commands' output** as I give you each step, or
   - you give me a way to **run commands on the Studio** directly (e.g. a terminal
     I can reach), or
   - I write you a **single setup script** you run and paste the result.

Then I'll create **DIME + NEIL** as the first two profiles, load their skills, and
we do the first safe test together — exactly per `docs/roadmap.md` (Phase 1).

---

## Don't do these yet ⛔ (they come later, with me)
- ❌ No gateway / Telegram / Discord yet.
- ❌ No voice yet.
- ❌ No cron / always-on yet.
- ❌ No local GPU model yet (we start on the easy hosted one).
- ❌ No turning agents "live" yet — that's the slow reveal, together.

## If it breaks (the magic reset order) 🩹
Run these in order until it's happy again:
```bash
hermes doctor
hermes model
hermes setup
```
That's it. Go make the box; ping me when Steps 4 and 6 are ticked. 🤘
