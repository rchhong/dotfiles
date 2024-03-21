#!/usr/bin/env bash

DOTFILES=$HOME/.dotfiles
TEMP=$DOTFILES/temp/
source $DOTFILES/scripts/helpers.sh

print_stage "Installing Development"

brew bundle --file brewfile_development

# Pnpm completions
pnpm install-completion zsh

# Needed for docker
brew services start colima