#!/bin/bash

echo "Construindo sub módulos"
git submodule init
git submodule update

echo "Instalando dependências"
sudo apt-get install build-essential cmake git python3-dev -y

echo "Instalando o vim"
sudo apt-get install vim-nox -y

echo "Criando pasta colors"
mkdir -p ~/.vim/colors

echo "Copiando esquema de cores para a pasta colors"
cp monokai/Monokai.vim ~/.vim/colors/monokai.vim

echo "Copiando vimrc para a pasta do vim"
cp .vimrc ~/

echo "Criando pasta bundle"
mkdir -p ~/.vim/bundle

echo "Copiando Vundle"
cp vundle ~/.vim/bundle/Vundle.vim

echo "Instalando plugins"
vim +PluginInstall +qall

echo "Instalando plugins"
python3 ~/.vim/bundle/YouCompleteMe/install.py
