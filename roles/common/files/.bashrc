#!/bin/bash

export PATH=~/bin:$PATH
export PATH=~/.local/bin:$PATH
export PATH=/opt/bin:$PATH

export SHELLCHECK_OPTS="-f gcc -e SC1090 -e SC2086 -e SC2087"

# don't overwrite history of another session
shopt -s histappend
export HISTCONTROL=erasedups:ignorespace:ignoredups
export HISTTIMEFORMAT='%F %T '

# edit & reload .bashrc
alias bashrc="$EDITOR ~/.bashrc && source ~/.bashrc"

alias open=gnome-open

alias sudo="sudo "
alias ls="ls --color=auto -v"
alias ll="ls -lF --color=auto -v"
alias l="ls -lF --color=auto -v"
alias llh="ls -lFh --color=auto -v"
alias lla="ls -lFa --color=auto -v"
alias llah="ls -lFah --color=auto -v"
alias llha="ls -lFah --color=auto -v"
#alias less="less -R" don't needed as above is auto
alias grep="grep -i"
# test aliases
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"
alias bc="bc -l -q"
alias uuid="uuid -v4"

alias perror='python -c "import os, sys; print os.strerror(int(sys.argv[1]))"'
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1])"'
alias urldecode='python -c "import sys, urllib as ul; print ul.unquote_plus(sys.argv[1])"'
function b64e() { base64 <<< $1; }
function b64d() { base64 -d <<< $1; }

for file in $(find ~/.bashrc.d/ -type f | sort); do
    source $file
done
