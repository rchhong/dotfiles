#!/usr/bin/env bash

DOTFILES=$HOME/.dotfiles
TEMP=$DOTFILES/temp/
source $DOTFILES/scripts/helpers.sh

print_stage "Installing Applications"

brew bundle --file caskfile
