# fzf.fish is only meant to be used in interactive mode. If not in interactive mode and not in CI, skip the config to speed up shell startup
if not status is-interactive && test "$CI" != true && not functions -q fzf_configure_bindings
    echo fzf.fish is only meant to be used in interactive mode. If not in interactive mode and not in CI, skip the config to speed up shell startup
    exit
end

if not type -q fzf
    echo "fzf not found in PATH. Please install fzf via your package manager or from"
    exit
end

if type -q atuin
    exit
end

# --- fzf integration ---
if test -f ~/.fzf.fish
    source ~/.fzf.fish
else if type -q fzf
    fzf --fish | source
end

# Because of scoping rules, to capture the shell variables exactly as they are, we must read
# them before even executing _fzf_search_variables. We use psub to store the
# variables' info in temporary files and pass in the filenames as arguments.
# This variable is global so that it can be referenced by fzf_configure_bindings and in tests
set --global _fzf_search_vars_command '_fzf_search_variables (set --show | psub) (set --names | psub)'

fzf_configure_bindings #--directory=\cf --git_log=\cl --git_status=\cs

# Doesn't erase autoloaded _fzf_* functions because they are not easily accessible once key bindings are erased
function _fzf_uninstall --on-event fzf_uninstall
    _fzf_uninstall_bindings

    set --erase _fzf_search_vars_command
    functions --erase _fzf_uninstall _fzf_migration_message _fzf_uninstall_bindings fzf_configure_bindings
    complete --erase fzf_configure_bindings

    set_color cyan
    echo "fzf.fish uninstalled."
    echo "You may need to manually remove fzf_configure_bindings from your config.fish if you were using custom key bindings."
    set_color normal
end

# Preview for zoxide completions
set -Ux fzf_preview_z_cmd eza --all --color=always
set -Ux fzf_preview_dir_cmd eza --all --color=always

set -Ux fzf_history_opts --height 40% \
    --border="rounded" \
    --border-label="" \
    --prompt=" ❯ " \
    --marker="*" \
    --pointer="→" \
    --separator="─" \
    --scrollbar="│" \
    --layout="reverse" \
    --info="right" \
    --cycle \
    --keep-right \
    --info=inline \
    --bind=btab:up,tab:down \
    --tabstop=1

set -x FZF_COLOR_OPTS "--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4"
set -x FZF_OPTS '--height 40% --border="rounded" --border-label="" --preview-window="border-rounded" --prompt=" ❯ " --marker="*" --pointer="→" --separator="─" --scrollbar="│" --layout="reverse" --info="right" --cycle --keep-right --info=inline --bind=btab:up,tab:down --tabstop=1'
set -x FZF_DEFAULT_OPTS "$FZF_COLOR_OPTS $FZF_OPTS"
