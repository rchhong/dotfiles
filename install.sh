#!/usr/bin/env bash

DOTFILES=$HOME/.dotfiles


if [[ "$(uname)" == "Darwin" ]]; then
    echo "Configuring MacOS"
    git clone https://github.com/InfernalHydra/dotfiles.git $DOTFILES
    $DOTFILES/scripts/osx/installOSX.sh
elif [[ "$(uname)" == "Linux" ]]; then
    if [[ -f "/etc/arch-release" ]]; then
      echo "Configuring Arch Linux (Manjaro)"
      git clone https://github.com/InfernalHydra/dotfiles.git $DOTFILES
      $DOTFILES/scripts/arch/installManjaro.sh
    else
      echo "Configuring Ubuntu"
      # Install git
      sudo add-apt-repository ppa:git-core/ppa -y
      sudo apt-get update
      sudo apt install -y git

      git clone https://github.com/InfernalHydra/dotfiles.git $DOTFILES
      $DOTFILES/scripts/ubuntu/install_ubuntu.sh
    fi
fi
