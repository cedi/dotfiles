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

