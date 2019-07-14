#!/bin/bash

source progressBar.sh

read -p "Has GNOME been separately installed (Y/N)? " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
	[[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1
fi
echo "$ZSH_VERSION"

echo "Installing terminal modifications for Linux"
# Install zsh
progressBar 0 4 "Installing zsh"
sudo apt install zsh
# Install curl
progressBar 1 4 "Installing curl"
sudo apt-get install curl
# Install oh-my-zsh
progressBar 2 4 "Installing oh-my-zsh"
sudo sh -c "$(wget -O- https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# Install Powerline Patched Fonts
progressBar 3 4 "Installing Powerline Patched Fonts"
sudo apt-get install fonts-powerline
echo "Remember to change the color theme to solarized dark\n"
progressBar 4 4 "Done!"



