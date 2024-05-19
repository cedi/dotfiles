# Shell integrations
if [ -f ~/.fzf.zsh ]; then
    eval "$(fzf --zsh)"
fi

# enable zoxide as cd alternative
if [[ $(command -v zoxide) ]]; then
	eval "$(zoxide init --cmd cd zsh)"
fi

# make cursor movement convenient in macOS
if [[ "$OSTYPE" == "darwin"* ]]; then
	bindkey "^[^[[D" backward-word
	bindkey "^[^[[C" forward-word
	bindkey "^[[H" beginning-of-line
	bindkey "^[[F" end-of-line
fi

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'