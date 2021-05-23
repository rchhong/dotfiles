#!/bin/bash

DOTFILES=$HOME/.dotfiles
source $DOTFILES/scripts/shared/helpers.sh

echo "Initializing dotfiles for Arch Linux"

progressBar 0 4 "Installing programs"
$DOTFILES/scripts/arch/installArchPrograms.sh

progressBar 1 4 "Installing terminal"
$DOTFILES/scripts/arch/installArchTerminal.sh

progressBar 2 4 "Installing UI"
$DOTFILES/scripts/arch/installArchPrograms.sh

progressBar 3 4 "symlinking"
$DOTFILES/scripts/shared/symlink.sh

progresBar 4 4 "Done!"
