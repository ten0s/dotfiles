#!/bin/bash

export PATH=~/bin:$PATH
export PATH=~/.local/bin:$PATH
export PATH=/opt/bin:$PATH

# don't overwrite history of another session
shopt -s histappend
export HISTCONTROL=erasedups:ignorespace:ignoredups
export HISTTIMEFORMAT='%F %T '

alias open="xdg-open"
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
alias cdtemp="cd `mktemp -d`"
alias pushdtemp="pushd `mktemp -d`"

alias perror='python3 -c "import os, sys; print(os.strerror(int(sys.argv[1])))"'
alias urlencode='python3 -c "import sys, urllib.parse; print(urllib.parse.quote_plus(sys.argv[1]))"'
alias urldecode='python3 -c "import sys, urllib.parse; print(urllib.parse.unquote_plus(sys.argv[1]))"'
function b64e() { base64 <<< $1; }
function b64d() { base64 -d <<< $1; }

if [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
fi

if [ -f ~/.bashrc.local ]; then
    source ~/.bashrc.local
fi

for file in $(find ~/.bashrc.d/ -type f | sort); do
    source $file
done
