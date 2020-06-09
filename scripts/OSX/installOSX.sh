#!/usr/bin/env bash
DOTFILES=$HOME/.dotfiles
source $DOTFILES/scripts/Shared/helpers.sh

# TODO: Add MacOS Install

# Ask for sudo
sudo -v

print_stage "INSTALLING HOMEBREW AND ZSH STUFF"
# oh my zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# powerline10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k

# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)" 

print_stage "INSTALLING PROGRAMS AND TERMINAL TOOLS"
brew bundle --file brewfile
brew bundle --file caskfile


# Vundle stuff here
# nvm
git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm
