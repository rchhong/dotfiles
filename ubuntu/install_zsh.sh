#!/bin/bash

DOTFILES=$HOME/.dotfiles
TEMP=$DOTFILES/temp/
source $DOTFILES/scripts/helpers.sh

echo "Installing zsh"
# Install zsh
print_info "Installing zsh"
sudo apt install zsh
chsh -s $(which zsh)

# Install oh-my-zsh
print_info "Installing oh-my-zsh"
sh -c "$(wget -O- https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install zsh autosuggestions 
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Install zsh syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting