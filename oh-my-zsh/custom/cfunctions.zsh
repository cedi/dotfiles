# Function for always using one (and only one) vim server, even when not
# using gvim.
# If you really want a new vim session, simply do not pass any
# argument to this function.
function vim {
  nvim="nvim"
  nvr="nvr"
  if [ -z $nvr ]; then
    echo "$SHELL: vim: command not found"
    return 127;
  fi
  
  $nvr --serverlist | grep nvimsocket > /dev/null

  # If there is already a vimserver, use it unless no args were given
  if [ $? -eq 0 ]; then
	  if [ $# -eq 0 ]; then
		  $nvim
	  else
		  $nvr --remote "$@"
	  fi
  else
	  $nvim "$@"
  fi
}

