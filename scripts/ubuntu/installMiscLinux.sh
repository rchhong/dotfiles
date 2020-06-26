#!/bin/bash

DOTFILES=$HOME/.dotfiles
source $DOTFILES/scripts/Shared/progressBar.sh 


echo "Installing Terminal Tools\n"
 
toDownload=(
	curl
	ffmpeg
	scrot
	i3lock
	imagemagick
	gnome-tweak-tool
	chrome-gnome-shell
	neofetch
	vim
	neovim
	htop
    onedrive
    fzf
)

other=(
	youtube-dl
	refind
)

let n=0
let total=${#toDownload[@]}+${#other[@]}
for i in "${toDownload[@]}"; do
	progressBar $n $total "Installing $i"
	sudo apt install $i
	((n++))
done


# Install youtube-dl
progressBar $n $total "Installing youtube-dl"
sudo wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl
((n++))

# Install refind
progressBar $n $total "Installing refind"
sudo apt-add-repository ppa:rodsmith/refind
sudo apt install refind
((n++))


progressBar $total $total "Done!"
echo ""

./installAppsLinux.sh


