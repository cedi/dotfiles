if not type -q git-tool
    return
end

alias gt="git-tool"
complete -f -c git-tool -a "(git-tool complete)"
abbr -a -- gto 'gt open shell gh:'
abbr -a -- gtc 'gt clone shell gh:'

abbr -a -- gtoc 'gt open shell gh:celonis/'
abbr -a -- gtcc 'gt clone shell gh:celonis/'

abbr -a -- gtos 'gt open shell gh:SpechtLabs/'
abbr -a -- gtcs 'gt clone shell gh:SpechtLabs/'

# Git tool config (persistent)
set -q GITTOOL_CONFIG; or set -x GITTOOL_CONFIG $XDG_CONFIG_HOME/git-tool/git-tool.yml
