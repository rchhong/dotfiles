#!/usr/bin/env bash

# Install zsh
apt install zsh
# Set zsh as defaut shell
chsh -s $(which zsh)
# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# Install Powerline Patched Fonts
apt-get install fonts-powerline
