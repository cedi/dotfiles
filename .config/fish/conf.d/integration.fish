# --- fzf integration ---
if test -f ~/.fzf.fish
    source ~/.fzf.fish
else if type -q fzf
    fzf --fish | source
end

# --- iTerm2 integration ---
if test "$TERM_PROGRAM" = "iTerm.app"
    if test -f "$DOTFILE_HOME/iterm2.fish"
        source "$DOTFILE_HOME/iterm2.fish"
    end
end

# --- zoxide (cd alternative) ---
if type -q zoxide
    zoxide init fish | source
end

# --- git-tool integration ---
if type -q git-tool
    alias gt=git-tool
end

# --- navi integration ---
if type -q navi
    navi widget fish | source
end

# --- ts-k8s-auth integration ---
if type -q ts-k8s-auth
    ts-k8s-auth shell fish | source
end

# --- the-fuck integration ---
if type -q thefuck
    thefuck --alias wtf | source
    abbr -a wtf 'wtf --yeah'
end
