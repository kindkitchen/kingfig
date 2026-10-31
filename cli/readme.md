# cli

Nushell scripts supporting the whole project. The root `justfile` is their public gateway: `just <action> <target> [...args]` runs `cli/<target>/<action>.nu [...args]` through `cli/main.nu`.

Explore: `just` lists actions, `just <action>` lists its targets, `just <action> <target> --help` explains one.

## Conventions

- One folder per feature (target), one script per action: `cli/<target>/<action>.nu` with a `def main`. Code shared by a feature's actions stays in its folder.
- Illustrative code: easy to read and to learn from.
- Rich doc comments on every command, parameter and flag, plus `@example`s, so `--help` explains each script.
- Data goes to stdout through `emit.nu`: a table in a terminal, JSON when piped. Messages go to stderr.
- Write operations (modify, delete, produce) have two modes. By default they only observe: check blockers and print a summary of what would be affected. Only `--apply` makes the writes, exactly as summarized.

`submodule/create.nu` is the reference implementation.
