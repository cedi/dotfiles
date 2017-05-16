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
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# easier grep
alias cgrep='grep -rsniI'

#easyer move up in folder
alias ..='cd ..'

# vagrant
alias vaup='vagrant up --provider virtualbox'
alias vassh='vagrant ssh'
alias vastart='vaup && vassh'

