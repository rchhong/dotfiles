#!/bin/bash

DOTFILES=$HOME/.dotfiles
source $DOTFILES/scripts/Shared/helpers.sh 

print_stage "SYMLINKKING FILES"

#Symbolic Link all config files
toSymlinkFiles=(
	.bashrc
	.gitconfig
	.vimrc
	.zshrc
)

toSymlinkDirectories=(
	.config
)

let n=0
let total=${#toSymlinkFiles[@]}+${#toSymlinkDirectories[@]}

for i in "${toSymlinkFiles[@]}"; do
	progress_bar $n $total "Symlinking $i"
	ln -sf $DOTFILES/link/$i ~/$i
	((n++))
done

progress_bar $n $total "Symlinking .zsh"
ln -sf $DOTFILES/link/.zsh ~/.zsh
((n++))

#Symbolic link ./.config

#Make directories
for i in "${toSymlinkDirectories[@]}"; do
	progress_bar $n $total "Symlinking $i"
    path="*/*";
    onlyOneWildcard=false;
    if [[ "$i" = ".themes" ]] || [[ "$i" = ".icons" ]]
    then
        path="*";
        onlyOneWildcard=true;
    fi
    for j in $DOTFILES/link/$i/$path; do
        relPath="$(echo $j | awk -F "/" '{ printf "%s/%s/%s", $6, $7, $8 }')"
        if $onlyOneWildcard ; then
            relPath="$(echo $j | awk -F "/" '{ printf "%s/%s", $6, $7}')"
        fi
        echo $j
        echo $HOME/$relPath
        [ -d "$HOME/$relPath" ] && sudo rm -r $HOME/$relPath
        sudo ln -sf $j $HOME/$relPath
    done
	((n++))
done

progress_bar $total $total "Done!"
print_success "FINISHED SYMLINKING"
