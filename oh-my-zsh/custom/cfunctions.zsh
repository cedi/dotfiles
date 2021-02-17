# Function for always using one (and only one) vim server
# If you really want a new vim session, simply do not pass any
# argument to this function.
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

# function to get better ping results (including timestamp when ping is sent
function pingt() {
	ipAddr=`dig "$1" | grep "ANSWER SECTION" -A 1 | tail -n 1 | awk '{print $5}'`

	if [[ -z "$ipAddr" ]]
	then
		ipAddr="$1"
	else
		echo -e "Resolve $1 to $ipAddr..."
	fi

	while :
	do
		ping -n -w1 -W1 -c1 "$ipAddr" | grep --color=never -E "rtt|100%"| sed -e "s/^/`date` - $ipAddr - /g";
		sleep 1;
	done
}

compdef _os-cloud os-cloud
function os-cloud {
    export OS_CLOUD=$1
}

function _os-cloud {
  local all_clouds="$(yq r ~/.config/openstack/clouds.yaml --printMode p '*.*' --stripComments | cut -d '.' -f 2)"
  _arguments \
    "(- *): :(${all_clouds})"
}
