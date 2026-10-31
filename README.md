# About

kingfig is a single source of truth for personal configuration, customization and preferences.

## Goals:

- One simple, declarative interface for managing configs from different tools.
- Full control over every change.
- Side-by-side observation and comparison of configs, as a base for further features.

Example: keyboard shortcuts can be viewed, extended, compared, changed and rolled back in one place.

The core problem kingfig solves is reading and delivering configs as artifacts across different systems, formats and conventions. It may have several interfaces, such as a CLI, TUI or GUI.

# Codebase organization

Organized as a monorepo by conventions only: no monorepo tool, neither third-party nor custom.

- The root belongs to no application: no `package.json`, `Cargo.toml` or similar manifest. It is the developer-oriented place: overview, shared files, helper scripts and anything else supporting the whole project.
- Applications (sub-projects) live in top-level folders, each with the files typical for its kind. Tech stacks may differ per sub-project.
- Each sub-project is a separate git repository, managed here as a git submodule.
- All submodules point to this same repository, each tracking its own branch. Every sub-project history starts from the `01-01-init` tag.
- Branches and tags of a sub-project are prefixed with its name: `example/main`, `example/dev`, `example-001-tag`.
- A top-level folder that is not a submodule is part of this repository: devx or whole-project oriented, not a project or a library.
- Code sharing between sub-projects is an open question. Do not apply any solution without discussion.

## Tooling

- Nushell is the first-class shell language: for scripts, commands and examples.
- `justfile` is the public gateway to all functionality of the `cli/` hub: nushell scripts following `cli/readme.md`.
- Commands form a tree, mostly 3 levels deep: `just <action> <target> [...args]`. The action is a general verb, overloaded by the target.
- Create a sub-project with `just create submodule --name=<name> --apply`.

# Agentic instructions

## Common

- Act only on explicit user intent. Nothing implicit unless it was explicitly allowed.
- Work in explicitly defined, incremental steps. Clarify until agree on each step with the user before moving on.
- Keep output and writes minimal. If not writing gives the same result, don't write.
- Focus on quality where quality is defined as efficient and sophisticated solution.

## Chat

- Be concise. No filler or unrequested elaboration.
- Raise any unplanned improvement, issue or warning as a short notice. Expand only if the user asks.

## Coding

## Responsibilities

- Before any write, state what will change and where. Write only after approval.
- Every action must be traceable to a user task or intention.

