############################
# Aliases

alias ls='exa --git'

# ls
# o = omit group id
# h = unit suffixes
# -F show suffixes in file/folder names
# # / for folder
# # * for executable
# # @ symlink
alias ll='ls --long --time-style=long-iso --time=modified'
alias lla='ll --all' # same as ll but show hidden

# colorize grep
alias grep='grep --color=always'
alias egrep='egrep --color=always'
alias fgrep='fgrep --color=always'

# configure ripgrep
alias crg='rg --pretty --ignore-case'

# easier grep
alias cgrep='grep -rsniI'

# easier move up in folder
alias ..='cd ..'

alias vi='/usr/local/bin/vim'

if [[ "$OSTYPE" != "darwin"* ]]; then
	alias ip='ip -color '
	alias ipb='ip -brief'
	alias ipals='ip -oneline addr ls'
fi

alias :q='exit'

alias de='setxkbmap de'
alias us='setxkbmap us'

alias newpasswd="openssl rand -base64 32"

# "not so nice lanugage" but great features
eval $(thefuck --alias wtf)
alias wtff='wtf --yeah'
alias fuck=sudo

