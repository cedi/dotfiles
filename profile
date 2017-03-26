if [ -d "$HOME/bin" ] ; then
	PATH="$HOME/bin:$PATH"
fi

export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

#=========================================================
#Terminal Color Codes
#=========================================================
WHITE='\[\033[1;37m\]'
LIGHTGRAY='\[\033[0;37m\]'
GRAY='\[\033[1;30m\]'
BLACK='\[\033[0;30m\]'
RED='\[\033[0;31m\]'
LIGHTRED='\[\033[1;31m\]'
GREEN='\[\033[0;32m\]'
LIGHTGREEN='\[\033[1;32m\]'
BROWN='\[\033[0;33m\]' #Orange
YELLOW='\[\033[1;33m\]'
BLUE='\[\033[0;34m\]'
LIGHTBLUE='\[\033[1;34m\]'
PURPLE='\[\033[0;35m\]'
PINK='\[\033[1;35m\]' #Light Purple
CYAN='\[\033[0;36m\]'
LIGHTCYAN='\[\033[1;36m\]'
DEFAULT='\[\033[0m\]'

#=========================================================
# User Configuration
#=========================================================
# Colors
cLINES=$GRAY #Lines and Arrow
cBRACKETS=$GRAY # Brackets around each data item
cERROR=$LIGHTRED # Error block when previous command did not return 0
cOK=$LIGHTGREEN # Success block when previous command did return 0
cTIME=$LIGHTGRAY # The current time
cMPX1=$YELLOW # Color for terminal multiplexer threshold 1
cMPX2=$RED # Color for terminal multiplexer threshold 2
cBGJ1=$YELLOW # Color for background job threshold 1
cBGJ2=$RED # Color for background job threshold 2
cSTJ1=$YELLOW # Color for background job threshold 1
cSTJ2=$RED # Color for  background job threshold 2
cSSH=$PINK # Color for brackets if session is an SSH session
cUSR=$LIGHTBLUE # Color of user
cUHS=$GRAY # Color of the user and hostname separator, probably '@'
cHST=$LIGHTGREEN # Color of hostname
cRWN=$RED # Color of root warning
cPWD=$BROWN # Color of current directory
cCMD=$DEFAULT # Color of the command you type
cGIT=$YELLOW # Color of the git branch

# Enable block
eNL=1  # Have a newline between previous command output and new prompt
eERR=1 # Previous command return status tracker
eCTM=1 # Show current time
ePWD=1 # Show current directory
eGITB=1 # Show git branch
eMPX=1 # Terminal multiplexer tracker enabled
eSSH=1 # Track if session is SSH
eBGJ=1 # Track background jobs
eSTJ=1 # Track stopped jobs
eUSH=1 # Show user and host

eShowGitStatus=0

# Block settins
MPXT1="0" # Terminal multiplexer threshold 1 value
MPXT2="2" # Terminal multiplexer threshold 2 value
BGJT1="0" # Background job threshold 1 value
BGJT2="2" # Background job threshold 2 value
STJT1="0" # Stopped job threshold 1 value
STJT2="2" # Stopped job threshold 2 value
UHS="@"

function parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

function promptcmd()
{
        PREVRET=$?
        #=========================================================
        #check if user is in ssh session
        #=========================================================
        if [[ $SSH_CLIENT ]] || [[ $SSH2_CLIENT ]]; then
                lSSH_FLAG=1
        else
                lSSH_FLAG=0
        fi

        PS1=""

        #=========================================================
        # Insert a new line to clear space from previous command
        #=========================================================
        if [[ eNL -ne 0 ]]; then
        	PS1="\n"
        fi

        #=========================================================
        # Beginning of first line (arrow wrap around and color setup)
        #=========================================================
        PS1="${PS1}${cLINES}\342\224\214\342\224\200"

        #=========================================================
        # First Dynamic Block - Previous Command Error
        #=========================================================
        if [[ eERR -ne 0 ]]; then
	        if [ $PREVRET -ne 0 ] ; then
	        	PS1="${PS1}${cBRACKETS}[${cERROR}:( - ${PREVRET}${cBRACKETS}]${cLINES}\342\224\200"
	        else
	        	PS1="${PS1}${cBRACKETS}[${cOK}:)${cBRACKETS}]${cLINES}\342\224\200"
	        fi	
        fi

        #=========================================================
        # First static block - Current time
        #=========================================================
        if [[ eCTM -ne 0 ]]; then
        	PS1="${PS1}${cBRACKETS}[${cTIME}\t${cBRACKETS}]${cLINES}\342\224\200"
        fi

        #=========================================================
        # Second Static Block - Current Directory
        #=========================================================
        if [[ ePWD ]]; then
        	PS1="${PS1}[${cPWD}\w${cBRACKETS}]"
        fi

		#========================================================
		# Git-Branch	
		#========================================================
		if [[ eGITB -ne 0 ]]; then
			PS1="${PS1}${cGIT}$(parse_git_branch) ${cLINES}"
		fi

        #=========================================================
        # Second Line
        #=========================================================
        PS1="${PS1}\n${cLINES}\342\224\224\342\224\200"

        #=========================================================
        # Third Static block - User@host
        #=========================================================
        # set color for brackets if user is in ssh session
        if [ $lSSH_FLAG -eq 1 ] ; then
            sesClr="$cSSH"
        else
            sesClr="$cBRACKETS"
        fi

        # don't display user if root
        if [ $EUID -eq 0 ] ; then
            PS1="${PS1}${sesClr}[${cRWN}!"
        else
            PS1="${PS1}${sesClr}[${cUSR}\u${cUHS}${UHS}"
        fi

        PS1="${PS1}${cHST}\h${sesClr}]${cLINES}\342\224\200"

        PS1="${PS1}\342\224\200> ${cCMD}"
}

function top_level_parent_pid {
    # Look up the parent of the given PID.
    pid=${1:-$$}
    stat=($(</proc/${pid}/stat))
    ppid=${stat[3]}

    # /sbin/init always has a PID of 1, so if you reach that, the current PID is
    # the top-level parent. Otherwise, keep looking.
    if [[ ${ppid} -eq 1 ]] ; then
        echo ${pid}
    else
        top_level_parent_pid ${ppid}
    fi
}

function load_prompt () {
    # Get PIDs
    local parent_process=top_level_parent_pid #$(cat /proc/$PPID/cmdline | cut -d \. -f 1)
    local my_process=$$ # $(cat /proc/$$/cmdline | cut -d \. -f 1)

    if  [[ $parent_process == script* ]]; then
        PROMPT_COMMAND=""
        PS1="\t - \# - \u@\H { \w }\$ "
    elif [[ $parent_process == emacs* || $parent_process == xemacs* ]]; then
        PROMPT_COMMAND=""
        PS1="\u@\h { \w }\$ "
    else
        export DAY=$(date +%A)
        PROMPT_COMMAND=promptcmd
     fi
    export PS1 PROMPT_COMMAND
}

# Load Bash-Prompt
load_prompt

############################
# Aliases

# ls
# o = omit group id
# h = unit suffixes
# -F show suffixes in file/folder names
# # / for folder
# # * for executable 
# # @ symlink
alias ll='ls -lohFG --color'
alias lla='ls -lohFGa --color' # same as ll but show hidden 

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

	# Function for always using one (and only one) vim server, even when not
# using gvim.
# If you really want a new vim session, simply do not pass any
# argument to this function.
function idevim {
  vim_orig="~/src/vim/src/vim"
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
