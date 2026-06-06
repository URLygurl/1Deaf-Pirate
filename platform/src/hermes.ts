// The orchestrator. route → run the chosen agent → capture to the HIVE → return.
import type { AgentConfig } from "./types.ts";
import { route } from "./router.ts";
import { buildSystemPrompt } from "./prompt.ts";
import { run, DEFAULT_MODEL } from "./llm.ts";
import { capture } from "./hive.ts";

export interface HermesResult {
  agent: string;
  why: string;
  output: string;
}

export async function ask(
  message: string,
  agents: AgentConfig[],
  onText?: (delta: string) => void,
): Promise<HermesResult> {
  const { agent, why } = await route(message, agents);
  const system = buildSystemPrompt(agent);
  const output = await run({
    system,
    user: message,
    model: agent.model ?? DEFAULT_MODEL,
    onText,
  });
  // Stage 1 of the HIVE loop — what one learns, all learn.
  capture({ ts: new Date().toISOString(), agent: agent.name, input: message, output });
  return { agent: agent.name, why, output };
}
