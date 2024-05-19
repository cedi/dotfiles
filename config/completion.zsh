# # # # #
# Load hcloud completion
if [[ $(command -v helm) && -d $HOME/.config/hcloud/completion/zsh ]]; then
	fpath+=($HOME/.config/hcloud/completion/zsh)
fi

# # # # #
# enable navi as shell widget
if [[ $(command -v navi) ]]; then
	eval "$(navi widget zsh)"
fi

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'
