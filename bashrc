#!/bin/bash
# File              : bashrc
# Author            : Xianglan Piao <lanxlpiao@gmail.com>
# Date              : 2018.08.12
# Last Modified Date: 2018.08.12
# Last Modified By  : Xianglan Piao <lanxlpiao@gmail.com>
# File: .bashrc
# Author: Xianglan Piao <lanxlpiao@gmail.com>
# Date: 2012.07.31


## User Command Configurations


## System Command Configurations
export PATH=/usr/local/bin/:/usr/bin:/bin:/usr/sbin:/sbin:/usr/texbin
export EDITOR=vim
export SVN_EDITOR=vim
export SVN_MERGE=vimdiff
export FIGNORE=.svn
export TERM=xterm-256color
export DISPLAY=:0
export GNUTERM=x11
export LSCOLORS="ExGxBxDxCxEgEdxbxgacad"
export GREP_COLORS="ms=01;32:mc=01;32:sl=:cx=01;30:fn=35:ln=32:bn=32:se=36"

if [ "$(uname)" = "Linux" ]; then
  alias ls='ls --color=auto'
elif [ "$(uname)" = "Darwin" ]; then
  export CLICOLOR=1
  export LC_ALL='en_US.UTF-8'
  # alias ctags="`brew --prefix`/bin/ctags"
else
  alias ls='ls --color=auto'
fi

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias grep="grep --exclude-dir='.svn' --exclude=tags --color=auto"
alias checkport="sudo lsof -i -P | grep -i 'listen'"


## Functions
function x11() {
  if [[ "$1" == "reset" ]]; then
    export DISPLAY=:0
    echo $DISPLAY
  elif [[ "$1" == "set" ]]; then
    export DISPLAY=localhost:10.0
    echo $DISPLAY
  fi
}

function monitor() {
  if [[ "$1" == "on" ]]; then
    xset dpms force on
    xset dpms s reset
    echo "Turn on monitor..."
  elif [[ "$1" == "off" ]]; then
    xset dpms force off
    echo "Turn off monitor..."
  fi
}

function countType() {
  find . -type f | sed -e 's/.*\.//' | sed -e 's/.*\///' | sort | uniq -c | sort -rn
}

function psColor() {
  local BLACK="\[\033[0;30m\]"
  local BLACKBOLD="\[\033[1;30m\]"
  local RED="\[\033[0;31m\]"
  local REDBOLD="\[\033[1;31m\]"
  local GREEN="\[\033[0;32m\]"
  local GREENBOLD="\[\033[1;32m\]"
  local YELLOW="\[\033[0;33m\]"
  local YELLOWBOLD="\[\033[1;33m\]"
  local BLUE="\[\033[0;34m\]"
  local BLUEBOLD="\[\033[1;34m\]"
  local PURPLE="\[\033[0;35m\]"
  local PURPLEBOLD="\[\033[1;35m\]"
  local CYAN="\[\033[0;36m\]"
  local CYANBOLD="\[\033[1;36m\]"
  local WHITE="\[\033[0;37m\]"
  local WHITEBOLD="\[\033[1;37m\]"

  if [ "$(uname)" = "Linux" ]; then
    export PS1="\[\e]0; \u@\h: \w\a\]$GREEN\u$GREEN@\h$YELLOW\w:\\$\[\e[00m\] "
  elif [ "$(uname)" = "Darwin" ]; then
    export PS1="\[\e]0; \u@\h: \w\a\]$RED\u$RED@\h$YELLOW\w:\\$\[\e[00m\] "
  elif [ "$(uname)" = "FreeBSD" ]; then
    export PS1="\[\e]0; \u@\h: \w\a\]$CYAN\u$CYAN@\h$YELLOW\w:\\$\[\e[00m\] "
  else
    export PS1="\[\e]0; \u@\h: \w\a\]$BLUE\u$BLUE@\h$YELLOW\w:\\$\[\e[00m\] "
  fi
}
psColor

function compress() {
  FILE=$1
  shift
  case $FILE in
    *.tar.bz2) tar cjf $FILE $* ;;
    *.tar.gz)  tar czf $FILE $* ;;
    *.tgz)     tar czf $FILE $* ;;
    *.zip)     zip $FILE $*     ;;
    *.rar)     rar $FILE $*     ;;
    *)         echo "Filetype not recognized" ;;
  esac
}

function extract() {
  if [[ -f $1 ]]; then
    case $1 in
      *.tar.bz2)  tar xjf $1    ;;
      *.tar.gz)   tar xzf $1    ;;
      *.tar.xz)   tar xf $1     ;;
      *.bz2)      bunzip2 $1    ;;
      *.rar)      unrar e $1    ;;
      *.gz)       gunzip $1     ;;
      *.tar)      tar xf $1     ;;
      *.tbz2)     tar xjf $1    ;;
      *.tgz)      tar xzf $1    ;;
      *.zip)      unzip $1      ;;
      *.Z)        uncompress $1 ;;
      *.7z)       7z x $1       ;;
      *)          echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a vaild file"
  fi
}

function t() {
  if [[ "$1" == "new" ]]; then
    tmux new -s $2
  elif [[ "$1" == "attach" ]]; then
    tmux a -t $2
  elif [[ "$1" == "sshattach" ]]; then
    ssh $2 -t "tmux -u -CC attach"
  elif [[ "$1" == "kill" ]]; then
    tmux kill-session -t $2
  fi
}
