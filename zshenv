export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

export EDITOR=nvim
export GO111MODULE=on
export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket

# Dotfile and config home
export DOTFILE_HOME=$HOME/.config/dotfiles
[ -d $HOME/.config ] && export XDG_CONFIG_HOME="$HOME/.config"

# # # # #
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$DOTFILE_HOME/oh-my-zsh/custom"

# # # # #
# Oh-My-Posh config
[ -d $DOTFILE_HOME/oh-my-posh/ ] && export OMP_CUSTOM="$DOTFILE_HOME/oh-my-posh/"

# # # # #
# Setup SOPS AGE Keys
[[ -d "$HOME/.age/sops" && -f "$HOME/.age/sops/keys_mae.txt" ]] && export SOPS_AGE_KEY_FILE="$HOME/.age/sops/keys_mae.txt"

# # # # #
# PATH Variable
export MY_PATH=""
[ -d $HOME/src/go ] && export GOPATH="$HOME/src/go"

[ -d $GOPATH ] && export MY_PATH="$MY_PATH:$GOPATH/bin"
[ -d $HOME/.krew/bin ] && export MY_PATH="$MY_PATH:$HOME/.krew/bin"
[ -d $HOME/bin ] && export MY_PATH="$MY_PATH:$HOME/bin"
[ -d $HOME/.local/bin ] && export MY_PATH="$MY_PATH:$HOME/.local/bin"
[ -d $HOME/.cargo/bin ] && export MY_PATH="$MY_PATH:$HOME/.cargo/bin"
[ -d $HOME/.gem/ruby/2.5.0/bin ] && export MY_PATH="$MY_PATH:$HOME/.gem/ruby/2.5. "
[ -d $HOME/.cog/fzf/bin ] && export MY_PATH="$MY_PATH:$HOME/.cog/fzf/bin"
[ -d /usr/local/bin ] && export MY_PATH="$MY_PATH:/usr/local/bin"
[ -d /usr/local/go/bin ] && export MY_PATH="$MY_PATH:/usr/local/go/bin"
[ -d /usr/local/share/python/ ] && export MY_PATH="$MY_PATH:/usr/local/share/python/"
[ -d $HOME/Library/Python/3.8/bin/ ] && export MY_PATH="$MY_PATH:$HOME/Library/Python/3.8/bin/"

# construct PATH variable
export PATH="$(echo "$MY_PATH:$PATH" | sed "s/:/\n/g" | awk '!x[$0]++' | sed -r '/^\s*$/d' | tr '\n' ':')"

