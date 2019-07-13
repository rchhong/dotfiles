#!/usr/bin/env bash

DOTFILES=$HOME/.dotfiles

#Symbolic Link all config files
toSymlink=(
	color.sh
	lock.png
	lock.sh
	.bashrc
	.gitconfig
	.vimrc
	.zshrc
)
for i in "${toSymlink[@]}"; do
	ln -sf $DOTFILES/link/$i ~/$i
done

#Symbolic link ./.config

ln -sf $DOTFILES/link/.config/* ~/.config/
