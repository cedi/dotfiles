# Aliases
if [[ "$OSTYPE" == "darwin"* ]]; then
	[[ -f $(which ggrep) ]] && alias indent=ggrep
	[[ -f $(which gindent) ]] && alias indent=gindent
	[[ -f $(which gtar) ]] && alias tar=gtar
	[[ -f $(which gsed) ]] && alias sed=gsed
	[[ -f $(which gsed) ]] && alias sed=gsed
	[[ -f $(which gawk) ]] && alias awk=gawk
	[[ -f $(which gmake) ]] && alias make=gmake
	[[ -f $(which gfind) ]] && alias find=gfind
	[[ -f $(which gwhich) ]] && alias which=gwhich
fi

if [ $(command -v eza) ]; then
	eza --git &> /dev/null
	if [ $? -eq 0 ]; then
		alias ls='eza --git --icons --group-directories-first'
	else
		alias ls='eza --icons --group-directories-first'
	fi

	alias la='ls --all'
	# ls
	# o = omit group id
	# h = unit suffixes
	# -F show suffixes in file/folder names
	# # / for folder
	# # * for executable
	# # @ symlink
	alias ll='ls --long --time-style=long-iso --time=modified'
	alias lla='ll --all' # same as ll but show hidden
else
	alias ll='ls -ltr'
	alias lla='ll -a'
fi

# colorize grep
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# easier grep
# -r = recursive
# -s = suppress error messages about nonexistent or unreadable files
# -n = prefix each line of output with the 1-based line number
# -i = ignore case
# -I = don't process binary files
alias cgrep='grep -rsniI'

# configure ripgrep
if [ $(command -v rg) ]; then
	alias crg='rg --pretty --ignore-case'
fi

# easier navigation
alias ..='cd ..'
alias :q='exit'
alias fuck=sudo

alias newpasswd="openssl rand -base64 32"

if [ $(command -v thefuck) ]; then
	eval $(thefuck --alias wtf)
	alias wtff='wtf --yeah'
fi

if [[ "$OSTYPE" != "darwin"* ]]; then
	alias ip='ip -color '
	alias ipb='ip -brief'
	alias ipals='ip -oneline addr ls'
else
	alias ipals='ip addr ls'
fi

if [[ $(command -v batcat) ]]; then
	alias bat='batcat'
	alias ybat='batcat -lyaml'
elif [[ $(command -v bat) ]]; then
	alias ybat='bat -lyaml'
fi

if [ $(command -v kubeval) ]; then
	alias kubeval='kubeval --ignore-missing-schemas --strict --schema-location https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/'
fi

if [[ "$OSTYPE" == "darwin"* ]]; then
  alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"
fi

# Function for always using one (and only one) vim server
# If you really want a new vim session, simply do not pass any
# argument to this function.

if [ $(command -v nvr) ]; then
	function vim {
	  nvim="nvim"
	  nvr="nvr"
	  if [ -z $nvr ]; then
	    echo "$SHELL: vim: command not found"
		$nvim "$@"
	    return 127;
	  fi

	  $nvr -s --servername 127.0.0.1:6789 "$@"
	}
fi

function mkcd() {
	mkdir -p "$@" && cd "$@";
}

if command -v kubectl &>/dev/null; then
  kube-cleanup() {
    kubectl get ns -o jsonpath='{.items[*].metadata.name}' | xargs -n1 -I{} bash -c '
      rs=$(kubectl get rs -n "$0" -o jsonpath="{range .items[?(@.spec.replicas==0)]}{.metadata.name}{\"\\n\"}{end}")
      if [ -n "$rs" ]; then
        echo "Deleting in $0:"
        echo "$rs" | xargs -n1 -r kubectl delete rs -n "$0"
      fi
    ' {}
  }
fi
