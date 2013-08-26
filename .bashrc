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
EDITOR="mate"
# EDITOR="vim"


function minutes_since_last_commit {
  now=`date +%s`
  last_commit=`git log --pretty=format:'%at' -1`
  seconds_since_last_commit=$((now-last_commit))
  minutes_since_last_commit=$((seconds_since_last_commit/60))
  echo $minutes_since_last_commit
}

last_commit_prompt() {
  if [ -n "$g" ]; then
    local MINUTES_SINCE_LAST_COMMIT=`minutes_since_last_commit`
    if [ "$MINUTES_SINCE_LAST_COMMIT" -gt 30 ]; then
        local COLOR=${RED}
    elif [ "$MINUTES_SINCE_LAST_COMMIT" -gt 10 ]; then
        local COLOR=${YELLOW}
    else
        local COLOR=${GREEN}
    fi
    local SINCE_LAST_COMMIT="${COLOR}$(minutes_since_last_commit)m${NORMAL}"
    echo ${SINCE_LAST_COMMIT}
  fi
}


# Prompt settings
export PS1="\[$RED\]\[$BLUE\]\\T\[$RED\] ›   \[$WHITE\]\u\[$GREEN\]@\[$RED\]\\W     \$(vcprompt -f '\[$YELLOW\](\[$BLUE\]%n\[$ERED\]:\[$BLUE\]%b\[$RED\]:\[$WHITE\]%r\[$RED\]%m%u\[$YELLOW\])') \n \[$GREEN\]\\$\[$NO_COLOR\] "

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

NODE_PATH="/usr/local/lib/node_modules"