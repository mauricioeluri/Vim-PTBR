#!/bin/bash

VIM=`which vim | wc -l`
APT=`which apt-get | wc -l`
YUM=`which yum | wc -l`

if [[ $VIM == 0 ]] && [[ $APT == 0 ]] && [[ $YUM == 0 ]]; then
    echo -e "\nThis distro is not supported."
    echo "Please install Vim manually and try again.";
fi

if [[ $APT == 1 ]]; then
    echo "Select the desired method of installation:"
    echo -e "\nNote that autocomplete requires a lot of resources."
    read -p "Install Vim with autocomplete? [y/N] " -n 1 -r
fi

echo -e "\nInstalling dependencies"
if [[ $REPLY == [yY]* ]]; then
    sudo apt-get install build-essential cmake python3-dev vim-nox -y
fi

if [[ $VIM == 0 ]] && [[ $APT == 1 ]]; then
    sudo apt-get install vim -y
fi

if [[ $VIM == 0 ]] && [[ $YUM == 1 ]]; then
    sudo yum install vim -y
fi

echo "Copying theme to themes folder"
mkdir -p ~/.vim/colors
cp monokai.vim ~/.vim/colors/

echo "Copying configs to user folder"
cp .vimrc ~/

echo "Copying vim plugin manager to vim folder"
mkdir -p ~/.vim/bundle
cp -r Vundle.vim ~/.vim/bundle/

if [[ $REPLY != [yY]* ]]; then
    sed -i /omplete/d ~/.vimrc
fi

echo "Installing plugins"
vim +PluginInstall +qall

if [[ $REPLY == [yY]* ]]; then
    echo "Installing autocomplete"
    python3 ~/.vim/bundle/YouCompleteMe/install.py
fi
