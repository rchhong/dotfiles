#!/usr/bin/env bash

DOTFILES=$HOME/.dotfiles
TEMP=$DOTFILES/temp/
source $DOTFILES/scripts/helpers.sh

print_stage "Installing terminal"
brew bundle --file brewfile
brew bundle --file caskfile

# Homebrew
print_stage "Installing Homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/ryanchhong/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# tmux plugin manager
print_info "Installing tmux plugin manager"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# fzf file completion
$(brew --prefix)/opt/fzf/install

print_stage "Installing config files"
$DOTFILES/scripts/link.sh bash conda fish git gpg kitty nvim raycast skhd ssh tmux vim yabai
$DOTFILES/scripts/link.sh kitty raycast skhd yabai

