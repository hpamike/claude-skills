# Claude Skills

A collection of shareable skills for Claude (Claude Code, Claude.ai, Cowork, and the Claude Agent SDK).

Each skill is a folder with a `SKILL.md` and optional `references/`, `scripts/`, and `assets/` subfolders. Drop a skill folder into your Claude skills directory to install it.

## Skills in this repo

- [**ai-fit-systeemcheck**](./ai-fit-systeemcheck) — Pre-flight system check for AI Fit workshops ("opwarmen en stretchen"). Detects Windows or Mac and whether the environment has shell access (Claude Code / Cowork desktop), runs the right checks per track (vibecoding or skills/PA) — Node.js, git, GitHub access, write permissions, accounts and minimum subscription — and reports PASS/FAIL with a clear GO/NO-GO. On GO, hands the participant a simple Hello World test to confirm the whole chain works. Includes `check.sh` (Mac/Linux) and `check.ps1` (Windows). (Skill content is in Dutch.)

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
