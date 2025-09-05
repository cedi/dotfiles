export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

export EDITOR=nvim
export GO111MODULE=on
export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket
[ -d $HOME/.config ] && export XDG_CONFIG_HOME="$HOME/.config"

# Dotfile and config home
export DOTFILE_HOME=$XDG_CONFIG_HOME/dotfiles

# # # # #
# Oh-My-Posh config
[ -d $XDG_CONFIG_HOME/oh-my-posh/ ] && export OMP_CUSTOM="$XDG_CONFIG_HOME/oh-my-posh/"

# # # # #
# Setup SOPS AGE Keys
[[ -d "$HOME/.age/sops" && -f "$HOME/.age/sops/keys_$(hostname).txt" ]] && export SOPS_AGE_KEY_FILE="$HOME/.age/sops/keys_$(hostname).txt"

# # # # #
# PATH Variable
export MY_PATH=""
[ -d $HOME/src/go ] && export GOPATH="$HOME/src/go"
[ -d $HOME/src/go ] && export GOBIN="$GOPATH/bin"

[[ -n "$GOPATH" ]] && [ -d $GOPATH ] && export MY_PATH="$MY_PATH:$GOPATH/bin"
[ -d $HOME/.krew/bin ] && export MY_PATH="$MY_PATH:$HOME/.krew/bin"
[ -d $HOME/bin ] && export MY_PATH="$MY_PATH:$HOME/bin"
[ -d $HOME/.local/bin ] && export MY_PATH="$MY_PATH:$HOME/.local/bin"
[ -d $HOME/.cargo/bin ] && export MY_PATH="$MY_PATH:$HOME/.cargo/bin"
[ -d $HOME/.gem/ruby/2.5.0/bin ] && export MY_PATH="$MY_PATH:$HOME/.gem/ruby/2.5. "
[ -d $XDG_CONFIG_HOME/fzf/bin ] && export MY_PATH="$MY_PATH:$XDG_CONFIG_HOME/fzf/bin"
[ -d /usr/local/bin ] && export MY_PATH="$MY_PATH:/usr/local/bin"
[ -d /usr/local/go/bin ] && export MY_PATH="$MY_PATH:/usr/local/go/bin"
[ -d /usr/local/share/python/ ] && export MY_PATH="$MY_PATH:/usr/local/share/python/"
[ -d $HOME/Library/Python/ ] && export MY_PATH="$MY_PATH:$HOME/Library/Python/*/bin/"
[ -d $HOME/.kube/kubediff ] && export MY_PATH="$MY_PATH:$HOME/.kube/kubediff"

# construct PATH variable
# construct PATH variable
{
  PATH_CLEANED=$(echo "$MY_PATH:$PATH" | tr ':' '\n' | awk '!x[$0]++' | sed '/^\s*$/d' | tr '\n' ':')
  export PATH="${PATH_CLEANED%:}"
} || true
# If we have a cargo env -> load it
[ -f $HOME/.cargo/env ] && . "$HOME/.cargo/env"

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

export FZF_COLORS='--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4'
export FZF_OPTS='--height 40% --border="rounded" --border-label="" --preview-window="border-rounded" --preview "bat --color=always --style=numbers --line-range=:500 {}" --prompt=" ❯ " --marker="*" --pointer="→" --separator="─" --scrollbar="│" --layout="reverse" --info="right" --cycle --keep-right --info=inline --bind=btab:up,tab:down --tabstop=1'
export FZF_DEFAULT_OPTS="$FZF_COLORS $FZF_OPTS"
export _ZO_FZF_OPTS="$FZF_DEFAULT_OPTS --exact --no-sort --bind=ctrl-z:ignore --exit-0 --select-1"

export GITTOOL_CONFIG="$XDG_CONFIG_HOME/git-tool/git-tool.yml"

# Dracula theme for GNU grep - https://draculatheme.com/grep
export GREP_COLORS="mt=1;38;2;255;85;85:fn=38;2;255;121;198:ln=38;2;80;250;123:bn=38;2;80;250;123:se=38;2;139;233;253"

# .env.zsh contains local environment variables not shared between machines
[ -f $HOME/.env.zsh ] && . $HOME/.env.zsh

return 0 2>/dev/null
