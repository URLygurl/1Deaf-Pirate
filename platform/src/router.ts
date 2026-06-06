// Picks which agent handles a request. Triggers first (cheap), LLM classifier as fallback.
import type { AgentConfig, RouteDecision } from "./types.ts";
import { classify } from "./llm.ts";

export async function route(message: string, agents: AgentConfig[]): Promise<RouteDecision> {
  const text = message.toLowerCase();

  // 1) keyword match on triggers / owned domains — fast and free.
  for (const a of agents) {
    const keys = [...(a.triggers ?? []), ...(a.owns ?? [])].map((k) => k.toLowerCase());
    if (keys.some((k) => k && text.includes(k))) {
      return { agent: a, why: `trigger match for ${a.name}` };
    }
  }

  // 2) fall back to Hermes deciding. Give it the roster, ask for one name.
  const roster = agents
    .map((a) => `- ${a.name} (${a.type}): ${a.role}. owns: ${(a.owns ?? []).join(", ") || "—"}`)
    .join("\n");
  const system =
    `You are DIME, the Hermes orchestrator. Route the user's request to exactly one specialist. ` +
    `Reply with ONLY that specialist's NAME, nothing else.\n\nRoster:\n${roster}`;
  const pick = (await classify(system, message)).replace(/[^A-Za-z0-9_-]/g, "");
  const chosen =
    agents.find((a) => a.name.toLowerCase() === pick.toLowerCase()) ?? agents[0];
  return { agent: chosen, why: `Hermes routed to ${chosen.name}` };
}
