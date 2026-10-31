use emit.nu

# The cli folder: features are its folders, actions their scripts.
const cli = path self .

# Route `just <action> <target> [...args]` to cli/<target>/<action>.nu.
#
# Without a target, lists the targets implementing the action.
@example "list the targets of an action" { just check }
@example "explain an action of a target" { just check code-review --help }
def --wrapped main [
    action: string   # What to do: check, create, remove, ...
    target?: string  # What to do it with: a feature folder in cli/.
    ...args          # Arguments of the action script, passed untouched (untyped, so never evaluated).
] {
    if $target in [null "" "--help" "-h"] {
        let targets = glob ($cli | path join "*" $"($action).nu") | each {|script|
            {target: ($script | path dirname | path basename), about: (^$nu.current-exe $script --help | lines | first)}
        }
        if ($targets | is-empty) { error make --unspanned {msg: $"no target implements ($action)"} }
        $targets | sort-by target | emit
        print -e $"`just ($action) <target> --help` explains one."
        return
    }
    let script = $cli | path join $target $"($action).nu"
    if not ($script | path exists) { error make --unspanned {msg: $"($target) has no ($action): cli/($target)/($action).nu is missing"} }
    ^$nu.current-exe $script ...$args
}
