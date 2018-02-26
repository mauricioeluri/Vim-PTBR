#!/bin/bash

sudo apt-get install vim-nox cmake python-dev

cp -r .vim ~/
cp .vimrc ~/

git clone https://gist.github.com/8248094.git .vim/colors/monokai
mv .vim/colors/monokai/Monokai.vim .vim/colors/monokai.vim
rm -rf .vim/colors/monokai

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

vim +PluginInstall +qall

python ~/.vim/bundle/YouCompleteMe/install.py

