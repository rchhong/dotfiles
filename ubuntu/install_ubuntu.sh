#!/bin/bash

DOTFILES=$HOME/.dotfiles
source $DOTFILES/scripts/helpers.sh

terminal_only_mode=false
work_mode=false
zsh=false

read -p "Terminal only mode (Y/N)? " -n 1 -r
echo
if [[ $REPLY =~ [Yy]$ ]]
then
	terminal_only_mode=true
fi

read -p "For work (Y/N)? " -n 1 -r
echo
if [[ $REPLY =~ [Yy]$ ]]
then
	work_mode=true
fi

read -p "zsh (Y/N)? " -n 1 -r
echo
if [[ $REPLY =~ [Yy]$ ]]
then
	zsh=true
fi

$DOTFILES/ubuntu/install_terminal.sh
$DOTFILES/ubuntu/install_development.sh

if [ "$terminal_only_mode" == false ]; then
	$DOTFILES/ubuntu/install_applications.sh
	$DOTFILES/ubuntu/install_settings.sh
	if [ "$work_mode" == false ]; then
		$DOTFILES/ubuntu/install_personal.sh
	fi
fi

if [ "$zsh" == true ]; then
	$DOTFILES/ubuntu/install_zsh.sh
fi

# Install config files
print_info "Installing config files"
$DOTFILES/scripts/link.sh -f bash bat conda fish git gpg kitty lazygit mamba nvim scripts ssh starship tmux vim zsh
