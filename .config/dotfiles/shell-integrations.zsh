# Shell integrations
[ -f ~/.fzf.zsh ] && eval "$(fzf --zsh)"

if [[ "$TERM_PROGRAM" == "iTerm.app"  ]]; then
    [ -f "$DOTFILE_HOME/iterm2.zsh" ] && source "$DOTFILE_HOME/iterm2.zsh"
fi

# enable zoxide as cd alternative
[[ $(command -v zoxide) ]] && eval "$(zoxide init --cmd cd zsh)"

if [[ $(command -v git-tool) ]]; then
    eval "$(git-tool shell-init zsh)"
    alias gt="git-tool"
fi

# enable navi as shell widget
if [[ $(command -v navi) ]]; then
	eval "$(navi widget zsh)"
fi

if [[ $(command -v mise) ]]; then
    eval "$(mise activate zsh)"
    alias m="mise"
fi

if [[ $(command -v ts-k8s-auth) ]]; then
  eval "$(ts-k8s-auth shell bash)"
fi

# make cursor movement convenient in macOS
bindkey "^[^[[D" backward-word
bindkey "^[^[[C" forward-word
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
