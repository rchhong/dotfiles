#!/bin/bash

source $DOTFILES/scripts/Shared/progressBar.sh 

DOTFILES=$HOME/.dotfiles
 
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
)
let n=0
let total=${toDownload[@]}
for i in "${toDownload[@]}"; do
	progressBar $n $total "Downloading $i"
	sudo apt install $i
	((n++))
done

# Install Vundle for vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# Install plugged for nvim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# Install nvim plugins
nvim +PlugInstall +qall
# Install vim plugins
oldvim +PluginInstall +qall
# Install youtube-dl
sudo wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl

# Install Canta theme
$HOME/.themes/Canta-theme/install.sh -c dark -i
echo "Remember to set themes up later\n"

# Install refind
sudo apt-add-repository ppa:rodsmith/refind
sudo apt install refind

# Install Onedrive
sudo apt install libcurl4-openssl-dev libsqlite3-dev
sudo snap install --classic dmd && sudo snap install --classic dub
git clone https://github.com/skilion/onedrive.git ~/onedrive
make -C ~/onedrive
sudo make -C ~/onedrive install
echo "Remember to setup OneDrive CLI Later \n"


