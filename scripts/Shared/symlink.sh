#!/bin/bash

DOTFILES=$HOME/.dotfiles
source $DOTFILES/scripts/Shared/helpers.sh 

print_stage "SYMLINKKING FILES"

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
	.config
)

#Make directories
for i in "${toSymlinkDirectories[@]}"; do
	progressBar $n $total "Symlinking $i"
    path="*/*";
    isThemeOrIcon=false;
    if [[ "$i" = ".themes" ]] || [[ "$i" = ".icons" ]]
    then
        path="*";
        isThemeOrIcon=true;
    fi
    for j in $DOTFILES/link/$i/$path; do
        relPath="$(echo $j | awk -F "/" '{ printf "%s/%s/%s", $6, $7, $8 }')"
        if $isThemeOrIcon ; then
            relPath="$(echo $j | awk -F "/" '{ printf "%s/%s", $6, $7}')"
        fi
        echo $j
        echo $HOME/$relPath
        [ -d "$HOME/$relPath" ] && sudo rm -r $HOME/$relPath
        sudo ln -sf $j $HOME/$relPath
    done
	((n++))
done

progressBar $total $total "Done!"
