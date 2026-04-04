#!/usr/bin/env bash

DOTFILES=$HOME/.dotfiles
TEMP=$DOTFILES/temp/
source $DOTFILES/scripts/helpers.sh

# install fish
brew install fish

# Add fish to known shells
command -v fish | sudo tee -a /etc/shells

# Change default shell to fish
chsh -s $(which fish)