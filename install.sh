#!/usr/bin/env bash

DOTFILES=$HOME/.dotfiles


if [ "$(uname)" == "Darwin" ]; then
    echo "Configuring MacOS"
    git clone https://github.com/InfernalHydra/dotfiles.git $DOTFILES
    $DOTFILES/scripts/OSX/installOSX.sh
elif [ "$(uname)" == "Linux" ]; then
    if [ -f "/etc/arch-release" ]; then
      echo "Configuring Arch Linux (Manjaro)"
      git clone https://github.com/InfernalHydra/dotfiles.git $DOTFILES
    else
      echo "Configuring Ubuntu"
      # Install git
      sudo apt install git
      git clone https://github.com/InfernalHydra/dotfiles.git $DOTFILES
      $DOTFILES/scripts/Linux/installLinux.sh
    fi
fi
