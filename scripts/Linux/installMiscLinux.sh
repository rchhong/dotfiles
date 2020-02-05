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
	numix-icon-theme
	numix-icon-theme-circle
	vim
	neovim
	htop
        onedrive
        fzf
)

other=(
	vundle
	plugged
	nvimplugins
	vimplugins
	youtube-dl
	canta
	refind
)

let n=0
let total=${#toDownload[@]}+${#other[@]}
for i in "${toDownload[@]}"; do
	progressBar $n $total "Installing $i"
	sudo apt install $i
	((n++))
done

# Install Vundle for vim
progressBar $n $total "Installing Vundle for vim"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
((n++))

# Install plugged for nvim
progressBar $n $total "Installing plugged for nvim"
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
((n++))

# Install nvim plugins
progressBar $n $total "Installing nvim plugins"
nvim +PlugInstall +qall
((n++))

# Install vim plugins
progressBar $n $total "Installing vim plugins"
oldvim +PluginInstall +qall
((n++))

# Install youtube-dl
progressBar $n $total "Installing youtube-dl"
sudo wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl
((n++))

# Install Canta theme
progressBar $n $total "Installing Canta theme"
$HOME/.themes/Canta-theme/install.sh -c dark -i
echo "Remember to set themes up later\n"
((n++))

# Install refind
progressBar $n $total "Installing refind"
sudo apt-add-repository ppa:rodsmith/refind
sudo apt install refind
((n++))


progressBar $total $total "Done!"
echo ""

./installAppsLinux.sh


