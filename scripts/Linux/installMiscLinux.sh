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
)

other=(
	vundle
	plugged
	nvimplugins
	vimplugins
	youtube-dl
	canta
	refind
	onedrive
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

# Install Onedrive
progressBar $n $total "Installing OneDrive CLI"
sudo apt install libcurl4-openssl-dev libsqlite3-dev
sudo snap install --classic dmd && sudo snap install --classic dub
git clone https://github.com/skilion/onedrive.git ~/onedrive
make -C ~/onedrive
sudo make -C ~/onedrive install
echo "Remember to setup OneDrive CLI Later\n"
((n++))

progressBar $total $total "Done!"
echo ""

./installAppsLinux.sh


