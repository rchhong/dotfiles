#!/bin/bash

DOTFILES=$HOME/.dotfiles
source $DOTFILES/scripts/shared/helpers.sh

echo "Initializing dotfiles for Arch Linux"

print_stage "Installing terminal"
$DOTFILES/scripts/arch/install_terminal.sh

print_stage "Installing applications"
$DOTFILES/scripts/arch/install_terminal.sh


print_success "Done!"
