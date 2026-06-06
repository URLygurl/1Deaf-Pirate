// Builds an agent's system prompt from its compact config + shared HIVE context.
// This is what replaces hand-writing a giant SOUL.md/SKILLS.md per agent.
import type { AgentConfig } from "./types.ts";
import { retrieve } from "./hive.ts";

export function buildSystemPrompt(agent: AgentConfig): string {
  const lines: string[] = [];
  lines.push(`You are ${agent.name}, a specialist in the DefPirate / Deadsound crew.`);
  if (agent.legend) lines.push(`Your persona is skinned on the rock legend ${agent.legend}.`);
  lines.push(`Role: ${agent.role}.`);
  if (agent.voice) lines.push(`Voice: ${agent.voice}.`);
  if (agent.skills?.length) {
    lines.push(`\nWhat you can do:`);
    for (const s of agent.skills) lines.push(`- ${s}`);
  }
  lines.push(
    agent.type === "closed"
      ? `\nYou are a CLOSED specialist: produce a clean, repeatable, verifiable result. Scoped output, no chit-chat.`
      : `\nYou are an OPEN specialist: collaborate, explore, use judgment. It's fine to think out loud.`
  );
  // Optional richer persona, if the user dropped a SOUL.md in the agent folder.
  if (agent.soul) lines.push(`\n--- SOUL ---\n${agent.soul.trim()}`);

  // Shared HIVE context — what the crew has learned recently.
  const recent = retrieve(3);
  if (recent.length) {
    lines.push(`\n--- HIVE (recent crew memory) ---`);
    for (const e of recent) lines.push(`- ${e.agent}: ${e.input} → ${e.output.slice(0, 140)}`);
  }
  lines.push(`\nReport back to DIME (Hermes) when done. Stay in character.`);
  return lines.join("\n");
}
