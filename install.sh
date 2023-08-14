#!/usr/bin/env bash

DOTFILES=$HOME/.dotfiles


if [[ "$(uname)" == "Darwin" ]]; then
    echo "Configuring MacOS"
    git clone https://github.com/rchhong/dotfiles.git $DOTFILES
    $DOTFILES/osx/install_osx.sh
    cd $DOTFILES
elif [[ "$(uname)" == "Linux" ]]; then
    if [[ -f "/etc/arch-release" ]]; then
      echo "Configuring Arch Linux (Manjaro)"
      git clone https://github.com/rchhong/dotfiles.git $DOTFILES
      cd $DOTFILES
      $DOTFILES/arch/install_arch.sh
    else
      echo "Configuring Ubuntu"
      # Install git
      sudo add-apt-repository ppa:git-core/ppa -y
      sudo apt-get update
      sudo apt install -y git

      git clone https://github.com/rchhong/dotfiles.git $DOTFILES
      cd $DOTFILES
      $DOTFILES/ubuntu/install_ubuntu.sh
    fi
fi
