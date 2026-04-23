# Claude Skills

A collection of shareable skills for Claude (Claude Code, Claude.ai, Cowork, and the Claude Agent SDK).

Each skill is a folder with a `SKILL.md` and optional `references/`, `scripts/`, and `assets/` subfolders. Drop a skill folder into your Claude skills directory to install it.

## Skills in this repo

- [**cialdini-audit**](./cialdini-audit) — Audit a website, landing page, email, or ad through Cialdini's seven principles of influence. Classifies each persuasion tactic as Detective (ethical), Smuggler (misleading), or Commissioner (fabricated), and produces a structured report with prioritized recommendations.

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
