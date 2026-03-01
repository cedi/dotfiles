# Trampoline: login shells source .bash_profile but not .bashrc.
# Ensure .bashrc is always loaded regardless of how bash is invoked.
[ -f ~/.bashrc ] && . ~/.bashrc
