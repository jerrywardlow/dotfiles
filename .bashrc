#! /bin/bash

[ -z "$PS1" ] && return

# Load aliases
if [ -a ${HOME}/.aliases ]; then
    . ${HOME}/.aliases
fi


# Prompt stuff

# Colors
green="\[\e[1;32m\]"
cyan="\[\e[1;36m\]"
blue="\[\e[1;34m\]"
purple="\[\e[1;35m\]"
yellow="\[\e[1;33m\]"
reset="\[\e[m\]"

# Prompt
source ~/.git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
export PS1="$purple\u$blue@\h$green\$(__git_ps1) $cyan\W \\$ $reset"
