# # # # #
# Load hcloud completion
if [[ $(command -v hcloud) && -d $HOME/.config/hcloud/completion/zsh ]]; then
	fpath+=($HOME/.config/hcloud/completion/zsh)
fi

# Load azure cli completion
if [[ $(command -v az) && -f $HOME/.azure/az.completion ]]; then
	source $HOME/.azure/az.completion
fi

# enable calendarapi completion
if [[ $(command -v calendarapi) ]]; then
  eval "$(calendarapi completion zsh)"
fi

# enable teleport completion
if [[ $(command -v tsh) ]]; then
  eval "$(tsh --completion-script-zsh)"
fi

if [[ $(command -v teleport) ]]; then
  eval "$(teleport --completion-script-zsh)"
fi

if [[ $(command -v tctl) ]]; then
  eval "$(tctl --completion-script-zsh)"
fi

if [[ $(command -v tbot) ]]; then
  eval "$(tbot --completion-script-zsh)"
fi



# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'
