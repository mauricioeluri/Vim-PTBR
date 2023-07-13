#!/bin/bash

VIM=`which vim | wc -l`
GIT=`which git | wc -l`
APT=`which apt-get | wc -l`
YUM=`which yum | wc -l`

if [[ $(($VIM+$GIT)) -ne 2 ]] && [[ $(($APT+$YUM)) -eq 0 ]]; then
    echo -e "\nThis distro is not supported."
    echo "Please install Vim manually and try again.";
fi

if [[ $APT == 1 ]]; then
    echo "Select the desired method of installation:"
    echo -e "\nNote that autocomplete requires a lot of resources."
    read -p "Install Vim with autocomplete? [y/N] " -n 1 -r
fi

echo -e "\nInstalling dependencies"
if [[ $GIT == 0 ]]; then
    if [[ $APT == 1 ]]; then
        sudo apt-get install git -y
    else
        sudo yum install git -y
    fi
fi

if [[ $VIM == 0 ]]; then
    if [[ $APT == 1 ]] && [[ $REPLY != [yY]* ]]; then
        sudo apt-get install vim -y
    else
        sudo yum install vim -y
    fi
fi

if [[ $REPLY == [yY]* ]]; then
    sudo apt-get install build-essential cmake python3-dev vim-nox -y
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
