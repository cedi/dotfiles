############################
# Aliases

# ls
# o = omit group id
# h = unit suffixes
# -F show suffixes in file/folder names
# # / for folder
# # * for executable 
# # @ symlink
alias ll='ls -lohFG'
alias lla='ls -lohFGa' # same as ll but show hidden 

#colorize grep
alias grep='grep --color=always'
alias egrep='egrep --color=always'
alias fgrep='fgrep --color=always'

# easier grep
alias cgrep='grep -rsniI'

#easyer move up in folder
alias ..='cd ..'

