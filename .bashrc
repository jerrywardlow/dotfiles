#! /bin/bash

[ -z "$PS1" ] && return

# Load aliases
if [ -a ${HOME}/.aliases ]; then
    . ${HOME}/.aliases
fi

export PS1="\[\e[1;35m\]\u\[\e[m\]\[\e[1;34m\]@\h\[\e[m\] \[\e[1;36m\]\W \\$ \[\e[m\]"
