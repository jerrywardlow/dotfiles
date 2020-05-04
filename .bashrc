#!/usr/bin/env bash

[ -z "$PS1" ] && return

# Load config files
if [ -d "$HOME/.conf.d" ];then
    for file in $HOME/.conf.d/*; do
        if [ -f "$file" ]; then
            . "$file"
        fi
    done
fi

# Local scripts
if ! [[ $PATH == *"$HOME/bin"* ]]; then export PATH=$PATH:$HOME/bin; fi

# Editor stuff
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
orange="\[\e[0;38;5;208m\]"
reset="\[\e[m\]"

# Source git-prompt script
if [ -f ~/.git-prompt.sh ]; then
    source ~/.git-prompt.sh
    export GIT_PS1_SHOWDIRTYSTATE=1
fi

# Put hostname in prompt if remote connection
if [ -n "$SSH_CLIENT" ]; then
    export PS1="$purple\u$blue@\h$green\$(__git_ps1) $cyan\W \\$ $reset"
else
    export PS1="$purple\u$green\$(__git_ps1) $cyan\W \\$ $reset"
fi

# Allow for prompt override
[ -f "$HOME/.ps1" ] && source "$HOME/.ps1"

export HISTSIZE=10000
export HISTFILESIZE=10000
shopt -s histappend

# Allow pinentry-curses with tmux
GPG_TTY=$(tty)
export GPG_TTY
