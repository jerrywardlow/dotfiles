#!/usr/bin/env bash

set -e

DIR="$( cd "$(dirname "${BASH_SOURCE[0]}" )" && pwd )"

curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh > ~/.git-prompt.sh

# Setup Vim plugin directory
mkdir -p ~/.vim/autoload/

# Pull most recent version of vim-plug plugin manager
curl https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim > ~/.vim/autoload/plug.vim

for item in .conf.d .bashrc .gitconfig .tmux.conf .vimrc
do
    ln -snf $DIR/$item ~
done

vim +PlugInstall +qall
