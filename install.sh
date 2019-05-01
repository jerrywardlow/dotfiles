#!/usr/bin/env bash

set -e

DIR="$( cd "$(dirname "${BASH_SOURCE[0]}" )" && pwd )"

curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh > ~/.git-prompt.sh

for item in .conf.d .bashrc .gitconfig .tmux.conf .vimrc .vim
do
    ln -snf $DIR/$item ~
done

vim +PlugInstall +qall
