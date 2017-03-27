#!/usr/bin/env bash

set -e

for item in .conf.d .bashrc .git-prompt.sh .gitconfig .tmux.conf .vimrc .vim
do
    ln -snf ~/dotfiles/$item ~
done

curl https://github.com/jerrywardlow.keys >> ~/.ssh/authorized_keys

chmod 0700 ~/.ssh
chmod 0600 ~/.ssh/authorized_keys

vim +PlugInstall +qall

source ~/.bashrc
