#!/bin/bash

source $DOTFILES/scripts/Shared/progressBar.sh 

DOTFILES=$HOME/.dotfiles
 
toDownload=(
	curl
	ffmpeg
	scrot
	i3lock
	gnome-tweak-tool
	chrome-gnome-shell
	neofetch
	numix-icon-theme
	numix-icon-theme-circle
)
let n=0
let total=${toDownload[@]}
for i in "${toDownload[@]}"; do
	progressBar $n $total "Downloading $i"
	sudo apt install $i
	((n++))
done

# Install youtube-dl
sudo wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl

# Install Canta theme
$HOME/.themes/Canta-theme/install.sh -c dark -i

# Install refind
sudo apt-add-repository ppa:rodsmith/refind
sudo apt install refind
 

