#!/usr/bin/env bash

set -e

for item in .aliases .bashrc .git-prompt.sh .gitconfig .vimrc .vim/
do
    cp -R ./$item ~/$item
done

echo "Close enough!"
