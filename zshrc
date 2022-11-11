source ~/.zshenv

[ -f "$DOTFILE_HOME/config/apple.zsh" ] && source "$DOTFILE_HOME/config/apple.zsh"
[ -f "$DOTFILE_HOME/config/oh-my-zsh.zsh" ] && source "$DOTFILE_HOME/config/oh-my-zsh.zsh"
[ -f "$DOTFILE_HOME/config/fzf.zsh" ] && source "$DOTFILE_HOME/config/fzf.zsh"
[ -f "$DOTFILE_HOME/config/completion.zsh" ] && source "$DOTFILE_HOME/config/completion.zsh"
[ -f "$DOTFILE_HOME/config/oh-my-posh.zsh" ] && source "$DOTFILE_HOME/config/oh-my-posh.zsh"

autoload -U compinit; compinit
