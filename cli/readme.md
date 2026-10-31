# cli

Nushell scripts supporting the whole project. The root `justfile` is their public gateway: `just <action> <target> [...args]` runs `cli/<action>.nu <target> [...args]`.

Explore: `just` lists actions, `just <action>` lists its targets, `just <action> <target> --help` explains one.

## Conventions

- One script per action: `cli/<action>.nu`, with a `def "main <target>"` per target and a `def main` that shows help.
- Illustrative code: easy to read and to learn from.
- Rich doc comments on every command, parameter and flag, plus `@example`s, so `--help` explains each script.
- Write operations (modify, delete, produce) have two modes. By default they only observe: check blockers and print a summary of what would be affected. Only `--apply` makes the writes, exactly as summarized.

`create.nu` is the reference implementation.
