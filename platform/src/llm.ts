// Anthropic client wrapper. One place that knows how to talk to Claude.
import Anthropic from "@anthropic-ai/sdk";

const client = new Anthropic(); // reads ANTHROPIC_API_KEY from env

export const DEFAULT_MODEL = "claude-opus-4-8";

/** Stream a response and return the full text. Used for agent turns (may be long). */
export async function run(opts: {
  system: string;
  user: string;
  model?: string;
  onText?: (delta: string) => void;
}): Promise<string> {
  const stream = client.messages.stream({
    model: opts.model ?? DEFAULT_MODEL,
    max_tokens: 64000,
    thinking: { type: "adaptive" },
    system: opts.system,
    messages: [{ role: "user", content: opts.user }],
  });
  if (opts.onText) stream.on("text", opts.onText);
  const final = await stream.finalMessage();
  return final.content
    .filter((b): b is Anthropic.TextBlock => b.type === "text")
    .map((b) => b.text)
    .join("");
}

/** A short, non-streamed classification call. Used by the router. */
export async function classify(system: string, user: string): Promise<string> {
  const res = await client.messages.create({
    model: DEFAULT_MODEL,
    max_tokens: 256,
    thinking: { type: "adaptive" },
    system,
    messages: [{ role: "user", content: user }],
  });
  return res.content
    .filter((b): b is Anthropic.TextBlock => b.type === "text")
    .map((b) => b.text)
    .join("")
    .trim();
}
