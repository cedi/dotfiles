# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM=$HOME/.config/dotfiles/oh-my-zsh/custom

autoload -U compinit; compinit

# # # # #
# Environment Variables
export GOPATH=$HOME/src/go

export PATH=$PATH:$HOME/bin
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/perl5/bin
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/.gem/ruby/2.5.0/bin
export PATH=$PATH:/usr/local/share/python/
export PATH=$PATH:$HOME/.krew/bin
export PATH=:$PATH:/usr/local/opt/ruby/bin

export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket

export EDITOR=nvim
export GO111MODULE=on

# # # # #
# make cursor movement convenient in macOS
if [[ "$OSTYPE" == "darwin"* ]]; then
	bindkey "[D" backward-word
	bindkey "[C" forward-word
	bindkey "^[a" beginning-of-line
	bindkey "^[e" end-of-line
fi

# # # # #
# Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# # # # #
# Git integration config
HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

# # # # #
# Plugins
plugins=(git sudo colored-man-pages zsh-autosuggestions debian zsh-syntax-highlighting meaningful-error-codes helm kubectl kkpctl)
if [[ "$OSTYPE" == "darwin"* ]]; then
	plugins+=(iterm2 osx)
fi

# # # # #
# Load custom modules
source $ZSH/oh-my-zsh.sh
source $ZSH_CUSTOM/aliases.zsh
source $ZSH_CUSTOM/cfunctions.zsh

# # # # #
# tmux config
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
    source /etc/profile.d/vte.sh
fi

precmd() {
  if [[ -n "$TMUX" ]]; then
    tmux setenv "$(tmux display -p 'TMUX_PWD_#D')" "$PWD"
  fi
}

# # # # #
# Load fzf
if [ -d ~/.fzf ]; then
	# Setup fzf
	# ---------
	if [[ ! "$PATH" == */.fzf/bin* ]]; then
		export PATH="$PATH:$HOME/.fzf/bin"
	fi

	# Auto-completion
	# ---------------
	[[ $- == *i* ]] && source "$HOME/.fzf/shell/completion.zsh" 2> /dev/null

	# Key bindings
	# ------------
	source "$HOME/.fzf/shell/key-bindings.zsh"
fi
