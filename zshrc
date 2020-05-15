# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_CUSTOM=$HOME/.config/dotfiles/oh-my-zsh/custom

export GOPATH=$HOME/src/go

export PATH=$PATH:$HOME/bin
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/perl5/bin
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/.gem/ruby/2.5.0/bin

export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket

export EDITOR=vim
export GO111MODULE=on

export TerraformPath=/home/cedi/src/adjoe.io/terraform
export AWS_ACCESS_KEY_ID="foo"
export AWS_SECRET_ACCESS_KEY="bar"

export PERL5LIB="/home/cedi/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"
export PERL_LOCAL_LIB_ROOT="/home/cedi/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"
export PERL_MB_OPT="--install_base \"/home/cedi/perl5\""
export PERL_MM_OPT="INSTALL_BASE=/home/cedi/perl5"

# ZSH_THEME="cedi"
ZSH_THEME="zsh-multiline/multiline"
HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
plugins=(git ssh-agent sudo colored-man-pages zsh-autosuggestions debian zsh-syntax-highlighting meaningful-error-codes)

source $ZSH/oh-my-zsh.sh
source $ZSH_CUSTOM/aliases.zsh
source $ZSH_CUSTOM/cfunctions.zsh


if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
    source /etc/profile.d/vte.sh
fi

precmd() {
  if [[ -n "$TMUX" ]]; then
    tmux setenv "$(tmux display -p 'TMUX_PWD_#D')" "$PWD"
  fi
}

if [ -d ~/.fzf ]; then
	# Setup fzf
	# ---------
	if [[ ! "$PATH" == */home/cedi/.fzf/bin* ]]; then
		export PATH="$PATH:/home/cedi/.fzf/bin"
	fi

	# Auto-completion
	# ---------------
	[[ $- == *i* ]] && source "/home/cedi/.fzf/shell/completion.zsh" 2> /dev/null

	# Key bindings
	# ------------
	source "/home/cedi/.fzf/shell/key-bindings.zsh"
fi

