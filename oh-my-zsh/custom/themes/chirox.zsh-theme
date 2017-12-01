autoload -Uz add-zsh-hook

_prompt_symbol=$' \u03BB> '
_branch_symbol=$'\u2387 '
_icon_sphere=$'\u25CF '
_icon_rc=$'\u203C'
_newline=$'\n'

ZSH_THEME_GIT_PROMPT_PREFIX="%B$FG[177]${_branch_symbol} %{%}"
ZSH_THEME_GIT_PROMPT_SUFFIX=""

status_line() {
	print -rP "${_newline}%B$FG[045]%n$fg[green]@$FG[045]%m:%f$fg[white] %~%f $(git_prompt_info)${reset_color}%f"
}

add-zsh-hook precmd status_line

PROMPT='%B$FG[045]${_prompt_symbol}%{$reset_color%}%b%f'
RPROMPT="%(?..%{$fg[red]%}%? ↵ %{$reset_color%})"
