#!/usr/bin/env bash

DOTFILES = $HOME/.dotfiles
if [ "$(uname)" == "Darwin" ]; then
    echo "Configuring MacOS"
    ./scripts/installOSX.sh
elif [ "$(uname)" == "Linux" ]; then
    echo "Configuring Linux"
    ./scripts/installLinux.sh
fi
