#!/usr/bin/env bash

set -e

DIR="$( cd "$(dirname "${BASH_SOURCE[0]}" )" && pwd )"

for item in .conf.d .bashrc .git-prompt.sh .gitconfig .tmux.conf .vimrc .vim
do
    ln -snf $DIR/$item ~
done

curl https://github.com/jerrywardlow.keys >> ~/.ssh/authorized_keys

chmod 0700 ~/.ssh
chmod 0600 ~/.ssh/authorized_keys

vim +PlugInstall +qall

source ~/.bashrc
