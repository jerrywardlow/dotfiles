#! /bin/bash

[ -z "$PS1" ] && return

# Load aliases
if [ -a ${HOME}/.aliases ]; then
    . ${HOME}/.aliases
fi
