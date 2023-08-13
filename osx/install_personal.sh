#!/usr/bin/env bash

DOTFILES=$HOME/.dotfiles
TEMP=$DOTFILES/temp/
source $DOTFILES/scripts/helpers.sh

# Install personal apps
brew bundle --file brewfile_personal
brew bundle --file caskfile_personal
brew bundle --file masfile

read -p "yabai (Y/N)? " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    brew install "koekeishiya/formulae/yabai"
    brew install "koekeishiya/formulae/skhd"

    yabai --install-service
    skhd --install-service
fi



# Fixes tlmgr issues
"/usr/local/texlive/$(ls -d /usr/local/texlive/ |head -n 1)/bin/universal-darwin/tlmgr" path add