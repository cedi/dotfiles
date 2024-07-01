export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

export EDITOR=nvim
export GO111MODULE=on
export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket

# Dotfile and config home
export DOTFILE_HOME=$HOME/.config/dotfiles
[ -d $HOME/.config ] && export XDG_CONFIG_HOME="$HOME/.config"

# # # # #
# Oh-My-Posh config
[ -d $DOTFILE_HOME/oh-my-posh/ ] && export OMP_CUSTOM="$DOTFILE_HOME/oh-my-posh/"

# # # # #
# Setup SOPS AGE Keys
[[ -d "$HOME/.age/sops" && -f "$HOME/.age/sops/keys_$(hostname).txt" ]] && export SOPS_AGE_KEY_FILE="$HOME/.age/sops/keys_$(hostname).txt"

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
[ -d $HOME/.config/fzf/bin ] && export MY_PATH="$MY_PATH:$HOME/.config/fzf/bin"
[ -d /usr/local/bin ] && export MY_PATH="$MY_PATH:/usr/local/bin"
[ -d /usr/local/go/bin ] && export MY_PATH="$MY_PATH:/usr/local/go/bin"
[ -d /usr/local/share/python/ ] && export MY_PATH="$MY_PATH:/usr/local/share/python/"
[ -d $HOME/Library/Python/ ] && export MY_PATH="$MY_PATH:$HOME/Library/Python/*/bin/"
[ -d $HOME/.kube/kubediff ] && export MY_PATH="$MY_PATH:$HOME/.kube/kubediff"

# construct PATH variable
export PATH="$(echo "$MY_PATH:$PATH" | sed "s/:/\n/g" | awk '!x[$0]++' | sed -r '/^\s*$/d' | tr '\n' ':')"

# If we have a cargo env -> load it
[ -f $HOME/.cargo/env ] && . "$HOME/.cargo/env"

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

export FZF_DEFAULT_OPTS='--height 40% --border="rounded" --border-label="" --preview-window="border-rounded" --preview "bat --color=always --style=numbers --line-range=:500 {}" --prompt=" ❯ " --marker="*" --pointer="→" --separator="─" --scrollbar="│" --layout="reverse" --info="right" --cycle --keep-right --info=inline --bind=btab:up,tab:down --tabstop=1'
export _ZO_FZF_OPTS="$FZF_DEFAULT_OPTS --exact --no-sort --bind=ctrl-z:ignore --exit-0 --select-1"
