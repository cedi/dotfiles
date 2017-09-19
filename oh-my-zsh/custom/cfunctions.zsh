# Function for always using one (and only one) vim server, even when not
# using gvim.
# If you really want a new vim session, simply do not pass any
# argument to this function.
function idevim {
  vim_orig="/usr/local/bin/vim"
  if [ -z $vim_orig ]; then
    echo "$SHELL: vim: command not found"
    return 127;
  fi
  $vim_orig --serverlist | grep -q VIM
  # If there is already a vimserver, use it
  # unless no args were given
  if [ $? -eq 0 ]; then
    if [ $# -eq 0 ]; then
      $vim_orig
    else
      $vim_orig --remote "$@"
    fi
  else
    $vim_orig --servername vim "$@"
  fi
}
