#!/bin/bash

DOTFILES=$HOME/.dotfiles
source $DOTFILES/scripts/Shared/progressBar.sh 

read -p "Has GNOME been separately installed (Y/N)? " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
	[[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1
fi

echo "Installing terminal modifications for Linux"
# Install zsh
progressBar 0 3 "Installing zsh"
sudo apt install zsh
# Install oh-my-zsh
progressBar 1 3 "Installing oh-my-zsh"
sudo sh -c "$(wget -O- https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# Install Powerline Patched Fonts
progressBar 2 3 "Installing Powerline Patched Fonts"
sudo apt install fonts-powerline
echo "Remember to change the color theme to solarized dark\n"
progressBar 3 3 "Done!"

./installMiscLinux.sh



