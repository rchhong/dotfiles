#!/bin/bash

source progressBar.sh 

DOTFILES=$HOME/.dotfiles


echo -e "Creating symlinks"

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
let n=0
let total=8
for i in "${toSymlink[@]}"; do
	progressBar $n $total "Symlinking $i"
	ln -sf $DOTFILES/link/$i ~/$i
	((n++))
done

#Symbolic link ./.config
progressBar $n $total "Symlinking .config"
ln -sf $DOTFILES/link/.config/* ~/.config/
progressBar $total $total "Done!"
