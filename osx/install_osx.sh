#!/usr/bin/env bash

DOTFILES=$HOME/.dotfiles
TEMP=$DOTFILES/temp/
source $DOTFILES/scripts/helpers.sh

work_mode=false
fish=false


read -p "For work (Y/N)? " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
	work_mode=true
fi

read -p "fish (Y/N)? " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
	fish=true
fi

# Ask for sudo
sudo -v

if [ "$fish" == true ]; then
	$DOTFILES/osx/install_fish.sh
fi
$DOTFILES/osx/install_zsh.sh
$DOTFILES/osx/install_terminal.sh
$DOTFILES/osx/install_development.sh
$DOTFILES/osx/install_applications.sh
$DOTFILES/osx/install_settings.sh
if [ "$work_mode" == false ]; then
    $DOTFILES/ubuntu/install_personal.sh
fi





