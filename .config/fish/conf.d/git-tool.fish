if not type -q git-tool
    return
end

alias gt="git-tool"
complete -f -c git-tool -a "(git-tool complete)"

# Git tool config (persistent)
set -q GITTOOL_CONFIG; or set -x GITTOOL_CONFIG $XDG_CONFIG_HOME/git-tool/git-tool.yml