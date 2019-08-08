#!/usr/bin/env bash

DOTFILES = $HOME/.dotfiles
# Install git
sudo apt install git
git clone https://github.com/InfernalHydra/dotfiles.git $DOTFILES

if [ "$(uname)" == "Darwin" ]; then
    echo "Configuring MacOS"
    $DOTFILES/scripts/installOSX.sh
elif [ "$(uname)" == "Linux" ]; then
    echo "Configuring Linux"
    $DOTFILES/scripts/installLinux.sh
fi
