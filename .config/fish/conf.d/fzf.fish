if not type -q fzf
    echo "fzf not found in PATH. Please install fzf via your package manager or from"
    exit
end

set -x FZF_DEFAULT_OPTS '--height 40% --border="rounded" --border-label="" --preview-window="border-rounded" --prompt=" ❯ " --marker="*" --pointer="→" --separator="─" --scrollbar="│" --layout="reverse" --info="right" --cycle --keep-right --info=inline --bind=btab:up,tab:down --tabstop=1'
