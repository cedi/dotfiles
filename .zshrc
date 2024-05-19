source ~/.zshenv

[ -f "$DOTFILE_HOME/shell-config/oh-my-posh.zsh" ] && source "$DOTFILE_HOME/shell-config/oh-my-posh.zsh"

#[ -f "$DOTFILE_HOME/shell-config/oh-my-zsh.zsh" ] && source "$DOTFILE_HOME/config/oh-my-zsh.zsh"
[ -f "$DOTFILE_HOME/shell-config/zinit.zsh" ] && source "$DOTFILE_HOME/shell-config/zinit.zsh"

autoload -U compinit; compinit
zinit cdreplay -q

[ -f "$DOTFILE_HOME/shell-config/aliases.zsh" ] && source "$DOTFILE_HOME/shell-config/aliases.zsh"
[ -f "$DOTFILE_HOME/shell-config/completion.zsh" ] && source "$DOTFILE_HOME/shell-config/completion.zsh"
[ -f "$DOTFILE_HOME/shell-config/history.zsh" ] && source "$DOTFILE_HOME/shell-config/history.zsh"
[ -f "$DOTFILE_HOME/shell-config/shell-integrations.zsh" ] && source "$DOTFILE_HOME/shell-config/shell-integrations.zsh"

# If you're using macOS, you'll want this enabled
[ -f "/opt/homebrew/bin/brew" ] && eval "$(/opt/homebrew/bin/brew shellenv)"