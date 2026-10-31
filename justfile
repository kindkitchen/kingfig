# Public gateway to the cli/ hub: `just <action> <target> [...args]`.
# cli/main.nu runs cli/<target>/<action>.nu; omit the target to list them.
# Recipes are nushell scripts, so arguments reach the actions untouched.

set positional-arguments
set script-interpreter := ["nu"]

[private]
[script]
default:
    just --list

# Check a target.
[script]
check target="" *args:
    def --wrapped main [...args] { nu cli/main.nu check ...$args }

# Set the config of a target.
[script]
config-set target="" *args:
    def --wrapped main [...args] { nu cli/main.nu config-set ...$args }

# Create a target.
[script]
create target="" *args:
    def --wrapped main [...args] { nu cli/main.nu create ...$args }

# Remove a target.
[script]
remove target="" *args:
    def --wrapped main [...args] { nu cli/main.nu remove ...$args }

# Retrieve a target.
[script]
retrieve target="" *args:
    def --wrapped main [...args] { nu cli/main.nu retrieve ...$args }

# Show the status of a target.
[script]
status target="" *args:
    def --wrapped main [...args] { nu cli/main.nu status ...$args }

# Test a target.
[script]
test target="" *args:
    def --wrapped main [...args] { nu cli/main.nu test ...$args }
