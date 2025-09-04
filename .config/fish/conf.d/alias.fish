if type -q batcat
    alias bat=batcat
end

abbr -a ybat 'bat -lyaml'
abbr -a jbat 'bat -ljson'
abbr -a mbat 'bat -lmarkdown'

# Grep
alias grep 'grep --color=auto'
alias egrep 'egrep --color=auto'
alias fgrep 'fgrep --color=auto'
alias cgrep 'grep -rsniI'
if type -q rg
    abbr -a crg 'rg --pretty --ignore-case'
end

# GoLang
abbr -a -- gob 'go build'
abbr -a -- goc 'go clean'
abbr -a -- god 'go doc'
abbr -a -- gof 'go fmt'
abbr -a -- gofa 'go fmt ./...'
abbr -a -- gog 'go get'
abbr -a -- goi 'go install'
abbr -a -- gol 'go list'
abbr -a -- gop 'cd $GOPATH'
abbr -a -- gopb 'cd $GOPATH/bin'
abbr -a -- gops 'cd $GOPATH/src'
abbr -a -- gor 'go run'
abbr -a -- got 'go test'
abbr -a -- gov 'go vet'

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