# Claude Skills

A collection of shareable skills for Claude (Claude Code, Claude.ai, Cowork, and the Claude Agent SDK).

Each skill is a folder with a `SKILL.md` and optional `references/`, `scripts/`, and `assets/` subfolders. Drop a skill folder into your Claude skills directory to install it.

## Skills in this repo

- [**critical-prompting**](./critical-prompting) — Turns Claude into a sharp sparring partner instead of a yes-man when the user asks for critique, review, or honest feedback on an idea, plan, essay, or decision. Applies self-attack, verification chains, thought trees, and pre-mortem frameworks to surface weak assumptions, counterarguments, and blind spots. (Skill content is in Dutch.)

## Installing a skill

Copy the skill folder into your Claude skills directory. On Cowork and Claude Code, this is typically:

```
~/.claude/skills/<skill-name>/
```

Claude will pick up the skill on next invocation.

## Contributing

Skills follow the [skill-creator](https://github.com/anthropics/claude-skills) conventions:

- `SKILL.md` with YAML frontmatter (`name`, `description`)
- A description that clearly names the triggers so Claude invokes the skill reliably
- Reference files in `references/` for deep detail, loaded progressively

## License

MIT. Use freely, attribution appreciated but not required.
