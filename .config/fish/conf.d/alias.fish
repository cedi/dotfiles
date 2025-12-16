# Grep
alias grep 'grep --color=auto'
alias egrep 'egrep --color=auto'
alias fgrep 'fgrep --color=auto'
alias cgrep 'grep -rsniI'
if type -q rg
    abbr -a crg 'rg --pretty --ignore-case --hidden'
end

# IP
if not string match -q "darwin*" $OSTYPE
    abbr -a ip 'ip -color'
    abbr -a ipb 'ip -brief'
    abbr -a ipals 'ip -oneline addr ls'
else
    abbr -a ipals 'ip addr ls'
end

if string match -q "darwin*" $OSTYPE
    alias tailscale='/Applications/Tailscale.app/Contents/MacOS/Tailscale'
end
