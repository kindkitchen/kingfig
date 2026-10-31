# Public gateway to the cli/ hub: `just <action> <target> [...args]`.
# Each action runs cli/<action>.nu; omit the target to list them.

set shell := ["nu", "-c"]

[private]
default:
    @just --list

# Create a <target>; omit it to list targets.
create target="--help" *args:
    nu cli/create.nu {{target}} {{args}}
