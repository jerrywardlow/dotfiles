#!/usr/bin/env bash

set -e

DIR="$( cd "$(dirname "${BASH_SOURCE[0]}" )" && pwd )"

for item in .conf.d .bashrc .git-prompt.sh .gitconfig .tmux.conf .vimrc .vim
do
    ln -snf $DIR/$item ~
done

vim +PlugInstall +qall
