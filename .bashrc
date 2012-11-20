HISTCONTROL=erasedups
HISTSIZE=10000
shopt -s histappend

# Colors
# No Color
NO_COLOR='\e[0m'
# Default Colors
BLACK='\e[0;30m'
RED='\e[0;31m'
GREEN='\e[0;32m'
YELLOW='\e[0;33m'
BLUE='\e[0;34m'
MAGENTA='\e[0;35m'
CYAN='\e[0;36m'
WHITE='\e[0;37m'

# Bold Colors
EBLACK='\e[1;30m'
ERED='\e[1;31m'
EGREEN='\e[1;32m'
EYELLOW='\e[1;33m'
EBLUE='\e[1;34m'
EMAGENTA='\e[1;35m'
ECYAN='\e[1;36m'
EWHITE='\e[1;37m'

# Underlined Colors
UBLACK='\e[4;30m'
URED='\e[4;31m'
UGREEN='\e[4;32m'
UYELLOW='\e[4;33m'
UBLUE='\e[4;34m'
UMAGENTA='\e[4;35m'
UCYAN='\e[4;36m'
UWHITE='\e[4;37m'

# Editor settings
#EDITOR="mate"
EDITOR="vim"


since_last_commit() {
  now=`date +%s`
  last_commit=`git log --pretty=format:'%at' -1`
  elapsed=$((now-last_commit))
  minutes=$((elapsed/60))
  seconds=$((elapsed-(minutes*60)))
  
  # Work out if we haven't commited for a while
  if [ "$minutes" -gt 15 ]; then
    COLOR=${RED}
  elif [ "$minutes" -gt 8 ]; then
    COLOR=${YELLOW}
  else
    COLOR=${GREEN}
  fi
  # Pretty print the timing
  printf "${NO_COLOR}${COLOR}${minutes}m${seconds}s${NO_COLOR}"
}


# Prompt settings
export PS1="\[$RED\]\[$BLUE\]$(date -j +%H)\[$MAGENTA\]:\[$BLUE\]$(date -j +%M)\[$MAGENTA\]:\[$BLUE\]$(date -j +%S)\[$RED\] ›   \[$WHITE\]\u\[$GREEN\]@\[$RED\]\W     \$(vcprompt -f '\[$YELLOW\](\[$BLUE\]%n\[$ERED\]:\[$BLUE\]%b\[$RED\]:\[$WHITE\]%r\[$RED\]%m%u\[$RED\]:$(since_last_commit))')    \n \[$GREEN\]→\[$NO_COLOR\] "

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

NODE_PATH="/usr/local/lib/node_modules"