#!/bin/bash

DOTFILES=$HOME/.dotfiles
source $DOTFILES/scripts/helpers.sh

print_stage "Installing Personal Applications"

# Install Discord
print_info "Installing Discord"
wget -O discord.deb https://discordapp.com/api/download?platform=linux&format=deb
sudo apt install -y discord.deb
rm -rf discord.deb

# Install TickTick
print_info "Installing TickTick"
wget -O ticktick.deb https://ticktick-download-linux.s3.amazonaws.com/download/linux/linux_deb_x64/ticktick-1.0.70-amd64.deb
sudo apt install -y ticktick.deb
rm -rf ticktick.deb

#Install Anki
print_info "Installing Anki"
sudo apt install libxcb-xinerama0 libxcb-cursor0 zstd
wget -O anki.tar.zst https://github.com/ankitects/anki/releases/download/2.1.65/anki-2.1.65-linux-qt6.tar.zst
tar xaf anki.tar.zst -C .
sudo anki-2.1.XX-linux-qt6/install.sh
rm -rf anki-2.1.XX-linux-qt6/ anki.tar.zst

# Install Bitwarden
print_info "Installing Bitwarden"
wget -O bitwarden.AppImage https://vault.bitwarden.com/download/?app=desktop&platform=linux
if [ ! -d "~/Applications" ]; then
    mkdir -p ~/Applications
fi
mv bitwarden.AppImage ~/Applications

touch ~/.local/share/applications/bitwarden.desktop
echo "[Desktop Entry]
Encoding=UTF-8
Name=Bitwarden
Exec=/home/ryanc/Applications/bitwarden.AppImage
Terminal=false
Type=Application
Categories=Utility;Development;
" >> ~/.local/share/applications/bitwarden.desktop

print_success "Done!"
