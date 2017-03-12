#!/usr/bin/env bash

set -e

for item in .conf.d/ .bashrc .git-prompt.sh .gitconfig .tmux.conf .vimrc .vim/
do
    cp -R ./$item ~/$item
done

cp -R ./.ssh ~

chmod 0700 ~/.ssh
chmod 0600 ~/.ssh/authorized_keys

vim +PlugInstall +qall

source ~/.bashrc
