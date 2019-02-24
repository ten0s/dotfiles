source ~/.bashrc.local

export EDITOR="emacs" # -nw"
export VISUAL=$EDITOR

export PATH=~/bin:$PATH
export PATH=~/.local/bin:$PATH
export PATH=/opt/bin:$PATH

export SHELLCHECK_OPTS="-f gcc -e SC1090 -e SC2086 -e SC2087"

export ORACLE_HOME=/usr/lib/oracle/12.1/client64
export SQLPATH=$HOME:$SQLPATH
alias sqlplus="rlwrap sqlplus64"
alias sqlplus64="rlwrap sqlplus64"

# don't overwrite history of another session
shopt -s histappend
export HISTCONTROL=erasedups:ignorespace:ignoredups
export HISTTIMEFORMAT='%F %T '

alias bashrc="$EDITOR ~/.bashrc && source ~/.bashrc"

alias open=gnome-open

alias docker_gci="for image in $(docker images | grep '<none>' | awk '{ print $3 }'); do docker rmi -f $image; done"

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
alias t="task"
alias ta="task add"
alias td="task delete"

alias perror='python -c "import os, sys; print os.strerror(int(sys.argv[1]))"'
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1])"'
alias urldecode='python -c "import sys, urllib as ul; print ul.unquote_plus(sys.argv[1])"'
function b64e() { base64 <<< $1; }
function b64d() { base64 -d <<< $1; }

alias sml="rlwrap sml"

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
alias gpushoq="git push origin qa"
alias gdt="git difftool"
alias gdtc="git difftool --cached"
alias gdf="git diff"
alias gdfc="git diff --cached"
alias gcommit="git commit -m"
alias gcommita="git commit --amend -m"
alias gcommite="git commit --allow-empty -m"
alias gmerge="git merge --no-off"
alias gbr="git branch"
alias gco="git checkout"
alias gpull="git pull"
alias gpullod="git pull origin develop"
alias gpullom="git pull origin master"
alias gpulloq="git pull origin qa"
alias gcl="git clone"
alias grem="git remote -v"

function gsshurl() {
    local OldUrl=`git remote -v | sed -E -n 's/origin\s*(.*) \(push\)/\1/p'`
    local NewUrl=`echo $OldUrl | sed -E 's#(https|git)://(.*)/(.*)/(.*)#git@\2:\3/\4#'`
    echo "old url:" $OldUrl
    echo "new url:" $NewUrl
    git remote set-url origin $NewUrl
}

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

########### SHOULD BE THE LAST SECTION ##############

function activate-erlang() {
    source /opt/r20.3/activate

    # FIX: /opt/REL/bin/start takes precedence over /sbin/start
    export PATH=/sbin:$PATH
    export ERL_AFLAGS="-kernel shell_history enabled"
}

activate-erlang

########### DO NOT MODIFY PATH AFTER HERE ##########

alias cdv="$_KERL_ACTIVE_DIR/lib/observer-*/priv/bin/cdv"

# OCaml specific config
which opam >/dev/null && eval `opam config env`

# Enable AWS CLI Bash completion
# http://docs.aws.amazon.com/cli/latest/userguide/cli-command-completion.html
complete -C '/usr/local/bin/aws_completer' aws
