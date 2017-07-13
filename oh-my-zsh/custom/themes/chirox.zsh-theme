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
  _icon_hbar='─'
  _icon_ulcorner='┌'
  _icon_llcorner='└'

  return_code="%(?..%{$fg[red]%}%? ↵ %{$reset_color%})"
  RPROMPT=' $return_code $PR_YELLOW%D{%a,%b%d %H:%M:%S}%{$reset_color%}'

  ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[green]%}${_branch_symbol} %{%}"
	ZSH_THEME_GIT_PROMPT_SUFFIX=""
	ZSH_THEME_GIT_PROMPT_DIRTY=""
	ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg_bold[green]%}${_icon_sphere}"
	ZSH_THEME_GIT_PROMPT_ADDED="%{$fg_bold[cyan]%}${_icon_sphere}"
	ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]%}${_icon_sphere}"
	ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}${_icon_sphere}"
	ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%}${_icon_sphere}"
	ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[red]%}${_icon_sphere}"
	ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[yellow]%}${_icon_sphere}"

	PROMPT='${_newline}%{$fg_bold[cyan]%}${_icon_ulcorner}${_icon_hbar}%n%{$fg_bold[white]%}@%{$fg_bold[cyan]%}%m %f$fg[yellow]%B%2~%b%f $(git_prompt_info) ${reset_color}%f${_newline}%B%{$fg_bold[cyan]%}${_icon_llcorner}${_icon_hbar}${_prompt_symbol}${reset_color}%b%f'
}

_apply_theme
