# Public gateway to the cli/ hub: `just <action> <target> [...args]`.
# cli/main.nu runs cli/<target>/<action>.nu; omit the target to list them.
# Recipes are nushell scripts, so arguments reach the actions untouched.

set positional-arguments
set script-interpreter := ["nu"]

[private]
[script]
default:
    just --list

# Create a <target>; omit it to list targets.
create target="--help" *args:
    nu cli/create.nu {{target}} {{args}}
