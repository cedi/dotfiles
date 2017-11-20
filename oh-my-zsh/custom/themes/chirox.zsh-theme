function plain_prompt() {
	local _rc="%(?..%? !)"
	PROMPT="%n@%m:%2~ $ "
	RPROMPT="${_rc}"
}

function _apply_theme() {
	_prompt_symbol=$' \u03BB> '
	_branch_symbol=$'\u2387 '
	_newline=$'\n'
	_icon_sphere=$'\u25CF '
	_icon_rc=$'\u203C'
	
	ZSH_THEME_GIT_PROMPT_PREFIX="%B$FG[177]${_branch_symbol} %{%}"
	ZSH_THEME_GIT_PROMPT_SUFFIX=""
	
	PROMPT='${_newline}%B$FG[045]%n$fg[green]@$FG[045]%m:%f$fg[white] %~%f $(git_prompt_info)${reset_color}%f${_newline}%B$FG[045]${_prompt_symbol}%{$reset_color%}%b%f'
	RPROMPT="%(?..%{$fg[red]%}%? ↵ %{$reset_color%})"
}

_apply_theme
