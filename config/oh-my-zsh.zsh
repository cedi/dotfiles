plugins=(sudo colored-man-pages)

if [[ "$OSTYPE" == "darwin"* ]]; then
	plugins+=(iterm2 macos)
fi

if [ -f $ZSH_CUSTOM/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh ]; then
	plugins+=(zsh-autosuggestions)
fi

if [[ "$TERM_PROGRAM" != "WarpTerminal" && -f $ZSH_CUSTOM/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh ]]; then
	plugins+=(zsh-syntax-highlighting)
fi

if [[ $(command -v kubectl) ]]; then
	plugins+=(kubectl)
fi

if [[ $(command -v helm) ]]; then
	plugins+=(helm)
fi

# Load custom modules
source $ZSH/oh-my-zsh.sh
#source $ZSH_CUSTOM/aliases.zsh
#source $ZSH_CUSTOM/cfunctions.zsh

# # # # #
# enable zoxide as cd alternative
if [[ $(command -v zoxide) ]]; then
	eval "$(zoxide init --cmd cd zsh)"

	export _ZO_FZF_OPTS="$FZF_DEFAULT_OPTS --exact --no-sort --bind=ctrl-z:ignore --exit-0 --select-1"
fi