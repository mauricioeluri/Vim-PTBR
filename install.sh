#!/bin/bash

echo "Instalando dependências"
sudo apt-get install build-essential cmake git python3-dev -y

echo "Instalando o vim"
sudo apt-get install vim-nox -y

echo "Clonando repositório do esquema de cores"
git clone https://gist.github.com/8248094.git .vim/colors/monokai

echo "Movendo esquema de cores para a pasta colors [diretorio clone]"
mv .vim/colors/monokai/Monokai.vim .vim/colors/monokai.vim

echo "Deletando pasta do repositório clonado"
rm -rf .vim/colors/monokai

echo "Copiando diretório clonado para a pasta do vim"
cp -r .vim ~/

echo "Copiando vimrc para a pasta do vim"
cp .vimrc ~/

echo "Clonando Vundle"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "Instalando plugins"
vim +PluginInstall +qall

echo "Instalando plugins"
python3 ~/.vim/bundle/YouCompleteMe/install.py
