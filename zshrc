source ~/.zshenv

#[ -f "$DOTFILE_HOME/config/oh-my-zsh.zsh" ] && source "$DOTFILE_HOME/config/oh-my-zsh.zsh"
[ -f "$DOTFILE_HOME/config/zinit.zsh" ] && source "$DOTFILE_HOME/config/zinit.zsh"
[ -f "$DOTFILE_HOME/config/completion.zsh" ] && source "$DOTFILE_HOME/config/completion.zsh"
[ -f "$DOTFILE_HOME/config/oh-my-posh.zsh" ] && source "$DOTFILE_HOME/config/oh-my-posh.zsh"
[ -f "$DOTFILE_HOME/config/history.zsh" ] && source "$DOTFILE_HOME/config/history.zsh"
[ -f "$DOTFILE_HOME/config/shell-integrations.zsh" ] && source "$DOTFILE_HOME/config/shell-integrations.zsh"
[ -f "$DOTFILE_HOME/config/aliases.zsh" ] && source "$DOTFILE_HOME/config/aliases.zsh"

autoload -U compinit; compinit
zinit cdreplay -q

# If you're using macOS, you'll want this enabled
if [[ -f "/opt/homebrew/bin/brew" ]] then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi