export XDG_CONFIG_HOME=$HOME/.config

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
	source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

autoload -U compinit; compinit

# # # # #
# Environment Variables
export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket

export EDITOR=nvim
export GO111MODULE=on

# # # # #
# PATH Variable
export MY_PATH=""
export GOPATH=$HOME/src/go

if [ -d $GOPATH ]; then
	export MY_PATH=$MY_PATH:$GOPATH/bin
fi

if [ -d $HOME/.krew/bin ]; then
	export MY_PATH=$MY_PATH:$HOME/.krew/bin
fi

if [ -d $HOME/bin ]; then
	export MY_PATH=$MY_PATH:$HOME/bin
fi

if [ -d $HOME/.local/bin ]; then
	export MY_PATH=$MY_PATH:$HOME/.local/bin
fi

if [ -d $HOME/.cargo/bin ]; then
	export MY_PATH=$MY_PATH:$HOME/.cargo/bin
fi

if [ -d $HOME/.gem/ruby/2.5.0/bin ]; then
	export MY_PATH=$MY_PATH:$HOME/.gem/ruby/2.5.0/bin
fi

if [ -d $HOME/.config/fzf/bin ]; then
	export MY_PATH=$MY_PATH:$HOME/.config/fzf/bin
fi

if [ -d /usr/local/bin ]; then
	export MY_PATH=$MY_PATH:/usr/local/bin
fi

if [ -d /usr/local/go/bin ]; then
	export MY_PATH=$MY_PATH:/usr/local/go/bin
fi

if [ -d /usr/local/share/python/ ]; then
	export MY_PATH=$MY_PATH:/usr/local/share/python/
fi

if [ -d $HOME/Library/Python/3.8/bin/ ]; then
	export MY_PATH=$MY_PATH:$HOME/Library/Python/3.8/bin/
fi

if [ -d "$HOME/.age/sops" ]; then
	if [ -f "$HOME/.age/sops/keys_mae.txt" ]; then
		export SOPS_AGE_KEY_FILE=$HOME/.age/sops/keys_mae.txt
	fi
fi

# construct PATH variable
export PATH=$(echo "$MY_PATH:$PATH" | sed 's/:/\n/g' | awk '!x[$0]++' | sed -r '/^\s*$/d' | tr '\n' ':')

export OMP_CUSTOM=$HOME/.config/dotfiles/oh-my-posh/

# # # # #
# make cursor movement convenient in macOS
if [[ "$OSTYPE" == "darwin"* ]]; then
	bindkey "^[^[[D" backward-word
	bindkey "^[^[[C" forward-word
	bindkey "^[[H" beginning-of-line
	bindkey "^[[F" end-of-line
fi

# # # # #
# Themes
eval "$(oh-my-posh --init --shell zsh --config $OMP_CUSTOM/themes/tron-cloud-native.omp.json)"

# # # # #
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$HOME/.config/dotfiles/oh-my-zsh/custom

# # # # #
# Plugins
plugins=(sudo colored-man-pages)
if [[ "$OSTYPE" == "darwin"* ]]; then
	plugins+=(iterm2 macos)
fi

if [ -f $ZSH_CUSTOM/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh ]; then
	plugins+=(zsh-autosuggestions)
fi

if [ -f $ZSH_CUSTOM/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh ]; then
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
source $ZSH_CUSTOM/aliases.zsh
source $ZSH_CUSTOM/cfunctions.zsh

# # # # #
# tmux config
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
    source /etc/profile.d/vte.sh
fi

# # # # #
# Load fzf
if [ -d $HOME/.config/fzf ]; then
	# Auto-completion
	# ---------------
	[[ $- == *i* ]] && source "$HOME/.config/fzf/shell/completion.zsh" 2> /dev/null

	# Key bindings
	# ------------
	source "$HOME/.config/fzf/shell/key-bindings.zsh"

	export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
fi

# # # # #
# Load hcloud completion
if [ -d $HOME/.config/hcloud/completion/zsh ]; then
	fpath+=($HOME/.config/hcloud/completion/zsh)
fi

# # # # #
# enable navi as shell widget

eval "$(navi widget zsh)"

# # # # #
# enable transient prompt
enable_poshtransientprompt
# enable posh-tooltips
enable_poshtooltips
