# # # # #
# Load fzf
if [ -d $HOME/.config/fzf ]; then
	# Auto-completion
	# ---------------
	[[ $- == *i* ]] && source "$HOME/.config/fzf/shell/completion.zsh" 2> /dev/null

	# Key bindings
	# ------------
	source "$HOME/.config/fzf/shell/key-bindings.zsh"

	export FZF_DEFAULT_OPTS='--height 40% --border="rounded" --border-label="" --preview-window="border-rounded" --prompt=" ❯ " --marker="*" --pointer="◆" --separator="─" --scrollbar="│" --layout="reverse" --info="right" --cycle --keep-right --info=inline --bind=btab:up,tab:down --tabstop=1'
fi

if [ -f ~/.fzf.zsh ]; then
	source ~/.fzf.zsh
fi
