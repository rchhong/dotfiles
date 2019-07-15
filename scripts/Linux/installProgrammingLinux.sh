#!/bin/bash

source $DOTFILES/scripts/Shared/progressBar.sh 


# Install vim and nvim
sudo apt install vim neovim
# Install Vundle for vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# Install plugged for nvim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# Install nvim plugins
nvim +PlugInstall +qall
# Install vim plugins
oldvim +PluginInstall +qall
