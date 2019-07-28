#!/bin/bash

source $DOTFILES/scripts/Shared/progressBar.sh 

DOTFILES=$HOME/.dotfiles


echo -e "Creating symlinks"

#Symbolic Link all config files
toSymlinkFiles=(
	color.sh
	lock.png
	lock.sh
	.bashrc
	.gitconfig
	.vimrc
	.zshrc
)
let n=0
let total=${toSymlinkFiles[@]}+${toSymlinkDirectories[@]} 
for i in "${toSymlinkFiles[@]}"; do
	progressBar $n $total "Symlinking $i"
	ln -sf $DOTFILES/link/$i ~/$i
	((n++))
done

#Symbolic link ./.config
toSymlinkDirectories=(
	.themes
	.icons
)

#Make directories

for i in "${toSymlinkDirectories[@]}"; do
	progressBar $n $total "Symlinking $i"
	[ -d "~/$i" ] && mkdir ~/$i
	ln -sf $DOTFILES/link/$i/* ~/$i/
	((n++))
done

progressBar $total $total "Done!"
