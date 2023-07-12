#!/bin/bash

echo "Select the desired method of installation:"
echo -e "\nNote that Autocomplete requires a lot of"
echo "resources, and should be installed if you"
echo "want a IDE-like Vim."
echo -e "\n(1) Ubuntu & Debian (apt-get) + Autocomplete;"
echo "(2) Ubuntu & Debian (apt-get) without Autocomplete;"
echo -e "(3) YUM (Amazon Linux) without Autocomplete.\n"

usage()
{
    read -p "Choose the method of installation 1-3: " -n 1 -r
    if [[ $REPLY != "1" ]] && [[ $REPLY != "2" ]] && [[ $REPLY != "3" ]]
    then
        echo -e "\nINVALID OPTION\n"
        usage
    fi
}

usage

echo -e "\nInstalling dependencies"
if [[ $REPLY == "1" ]]; then
    sudo apt-get install build-essential cmake python3-dev vim-nox -y
elif [[ $REPLY == "2" ]]; then
    sudo apt-get install git vim-nox -y
elif [[ $REPLY == "3" ]]; then
    sudo yum install git -y
fi

echo "Cloning vim extensions"
git submodule init
git submodule update

echo "Copying theme to themes folder"
mkdir -p ~/.vim/colors
cp monokai.vim ~/.vim/colors/

echo "Copying configs to user folder"
cp .vimrc ~/

echo "Copying vim plugin manager to vim folder"
mkdir -p ~/.vim/bundle
cp -r Vundle.vim ~/.vim/bundle/

if [[ $REPLY != "1" ]]; then
    sed -i /omplete/d ~/.vimrc
fi

echo "Installing plugins"
vim +PluginInstall +qall

if [[ $REPLY == "1" ]]; then
    echo "Installing autocomplete"
    python3 ~/.vim/bundle/YouCompleteMe/install.py
fi
