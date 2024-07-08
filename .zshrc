source ~/.zshenv

[ -f "$DOTFILE_HOME/oh-my-posh.zsh" ] && source "$DOTFILE_HOME/oh-my-posh.zsh"

#[ -f "$DOTFILE_HOME/oh-my-zsh.zsh" ] && source "$DOTFILE_HOME/config/oh-my-zsh.zsh"
[ -f "$DOTFILE_HOME/zinit.zsh" ] && source "$DOTFILE_HOME/zinit.zsh"

autoload -U compinit; compinit
zinit cdreplay -q

[ -f "$DOTFILE_HOME/aliases.zsh" ] && source "$DOTFILE_HOME/aliases.zsh"
[ -f "$DOTFILE_HOME/completion.zsh" ] && source "$DOTFILE_HOME/completion.zsh"
[ -f "$DOTFILE_HOME/history.zsh" ] && source "$DOTFILE_HOME/history.zsh"
[ -f "$DOTFILE_HOME/shell-integrations.zsh" ] && source "$DOTFILE_HOME/shell-integrations.zsh"

# If you're using macOS, you'll want this enabled
[ -f "/opt/homebrew/bin/brew" ] && eval "$(/opt/homebrew/bin/brew shellenv)"
