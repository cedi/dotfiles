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
