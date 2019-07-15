#!/bin/bash

source $DOTFILES/scripts/Shared/progressBar.sh 

DOTFILES=$HOME/.dotfiles

# Install curl
sudo apt install curl
# Install ffmpeg
sudo apt install ffmpeg
# Install youtube-dl
sudo wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl
# Install scrot
sudo apt install scrot
# Install i3lock (for lock script0
sudo apt install i3lock
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
# Install gnome-tweaks
sudo apt install gnome-tweak-tool
# Install neofetch
sudo apt install neofetch
# Install numix and numix circle
sudo apt install numix-icon-theme numix-icon-theme-circle
# Install Canta theme
$HOME/.themes/Canta-theme/install.sh -c dark -i

