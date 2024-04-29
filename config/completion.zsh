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

# # # # #
# enable transient prompt
#enable_poshtransientprompt
# enable posh-tooltips
#enable_poshtooltips
