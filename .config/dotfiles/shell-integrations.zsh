# Shell integrations
[ -f ~/.fzf.zsh ] && eval "$(fzf --zsh)"

if [[ "$TERM_PROGRAM" == "iTerm.app"  ]]; then
    [ -f "$DOTFILE_HOME/iterm2.zsh" ] && source "$DOTFILE_HOME/iterm2.zsh"
fi

# enable zoxide as cd alternative
[[ $(command -v zoxide) ]] && eval "$(zoxide init --cmd cd zsh)"

# enable navi as shell widget
if [[ $(command -v navi) ]]; then
	eval "$(navi widget zsh)"
fi

# make cursor movement convenient in macOS
bindkey "^[^[[D" backward-word
bindkey "^[^[[C" forward-word
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
