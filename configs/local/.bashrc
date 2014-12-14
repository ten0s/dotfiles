export EDITOR="emacs" # -nw"
export VISUAL=$EDITOR

export PATH=/opt/bin:$PATH
export PATH=/opt/mongodb/bin:$PATH
export PATH=/opt/rabbitmq/sbin:$PATH

export HISTCONTROL=erasedups:ignorespace #:ignoredups
export HISTTIMEFORMAT='%F %T '

alias bashrc="$EDITOR ~/.bashrc && source ~/.bashrc"

alias open=gnome-open

alias ls="ls --color=auto"
alias ll="ls -lF --color=auto"
alias la="ls -laF --color=auto"
#alias less="less -R" don't needed as above is auto
alias grep="grep -i"
# test aliases
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"
alias bc="bc -l -q"
alias t="task"
alias ta="task add"
alias td="task delete"

alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1])"'
alias urldecode='python -c "import sys, urllib as ul; print ul.unquote_plus(sys.argv[1])"'
#alias wget="wget --limit-rate=256k"

########### FUNs ##############

function notify {
    local timeout="$1"
    local message="$2"
    $(sleep $timeout && notify-send $message) &
}

########### GIT SPECIFIC ##############

alias gst="git status"
alias glg="git log"
alias gad="git add"
alias gai="git add --interactive"
alias gap="git add --patch"
alias gmv="git mv"
alias grm="git rm"
alias gpush="git push"
alias gpushod="git push origin develop"
alias gpushom="git push origin master"
alias gdt="git difftool"
alias gdtc="git difftool --cached"
alias gdf="git diff"
alias gdfc="git diff --cached"
alias gcommit="git commit -m"
alias gcommita="git commit -am"
alias gbr="git branch"
alias gco="git checkout"
alias gpull="git pull"
alias gpullod="git pull origin develop"
alias gpullom="git pull origin master"
alias gcl="git clone"

function parse_git_dirty {
    [[ -n $(git status --porcelain) ]] && echo "*"
}

function parse_git_branch {
    if [[ `git branch 2> /dev/null` ]]; then
        git branch --no-color | sed -e "/^[^*]/d" -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
    fi
}

#http://techcommons.stanford.edu/topics/git/show-git-branch-bash-prompt
PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\033[00m\]$(parse_git_branch)\[\033[01;34m\] \$\[\033[00m\] '

function efind() {
    local ROOTDIR=`which erl | sed -ne '/^ROOTDIR=/s///p'`
    find $ROOTDIR -name $1.erl | awk -F / '{print $(NF-2)}' | awk -F - '{print $1}'
}

########### SHOULD BE THE LAST SECTION ##############

function set-erlang-root() {
    export ERL_ROOT=$1
    export ERL_MANPATH=$ERL_ROOT/lib/erlang/man
    export PATH=$ERL_ROOT/bin:$PATH
}

function set-r16b03-1() {
    set-erlang-root "/opt/otp-r16b03-1"
}

function set-r17() {
    set-erlang-root "/opt/otp-r17"
}

set-r16b03-1

########### DO NOT MODIFY PATH AFTER HERE ##########
