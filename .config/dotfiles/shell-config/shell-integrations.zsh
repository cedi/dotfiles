# Shell integrations
[ -f ~/.fzf.zsh ] && eval "$(fzf --zsh)"

if [[ "$TERM_PROGRAM" == "iTerm.app"  ]]; then
    [ -f "$DOTFILE_HOME/shell-config/iterm2_shell_integration.zsh" ] && source "$DOTFILE_HOME/shell-config/iterm2_shell_integration.zsh"
fi

# enable zoxide as cd alternative
[[ $(command -v zoxide) ]] && eval "$(zoxide init --cmd cd zsh)"

# make cursor movement convenient in macOS
bindkey "^[^[[D" backward-word
bindkey "^[^[[C" forward-word
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
