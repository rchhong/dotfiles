#!/bin/bash

DOTFILES=$HOME/.dotfiles
TEMP=$DOTFILES/temp
source $DOTFILES/scripts/helpers.sh

print_stage "Installing Personal Applications"

# Install Discord
print_info "Installing Discord"
wget -O $TEMP/discord.deb https://discordapp.com/api/download?platform=linux&format=deb
sudo apt install -y $TEMP/discord.deb

# Install TickTick
print_info "Installing TickTick"
wget -O $TEMP/ticktick.deb https://ticktick-download-linux.s3.amazonaws.com/download/linux/linux_deb_x64/ticktick-1.0.70-amd64.deb
sudo apt install -y $TEMP/ticktick.deb

#Install Anki
print_info "Installing Anki"
sudo apt install libxcb-xinerama0 libxcb-cursor0 zstd
wget -O $TEMP/anki.tar.zst https://github.com/ankitects/anki/releases/download/2.1.65/anki-2.1.65-linux-qt6.tar.zst
tar xaf $TEMP/anki.tar.zst -C $TEMP/
sudo $TEMP/anki-2.1.XX-linux-qt6/install.sh

print_success "Done!"
