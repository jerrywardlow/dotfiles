#! /bin/bash

[ -z "$PS1" ] && return

# Load config files
if [ -d "${HOME}/.conf.d" ];then
    for file in ${HOME}/.conf.d/*; do
        if [ -f "${file}" ]; then
            . "${file}"
        fi
    done
fi

export VISUAL=vim
export EDITOR=$VISUAL

# Prompt stuff

# Colors
red="\[\e[1;31m\]"
green="\[\e[1;32m\]"
yellow="\[\e[1;33m\]"
blue="\[\e[1;34m\]"
purple="\[\e[1;35m\]"
cyan="\[\e[1;36m\]"
gray="\[\e[1;37m\]"
reset="\[\e[m\]"

# Prompt
source ~/.git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
export PS1="$purple\u$blue@\h$green\$(__git_ps1) $cyan\W \\$ $reset"

# Tmux color fix
alias tmux='tmux -2'
