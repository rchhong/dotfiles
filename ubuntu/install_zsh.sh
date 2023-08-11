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