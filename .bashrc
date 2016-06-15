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

export PS1="$purple\u$blue@\h $cyan\W \\$ $reset"
