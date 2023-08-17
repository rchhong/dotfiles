!/bin/bash

DOTFILES=$HOME/.dotfiles
TEMP=$DOTFILES/temp
source $DOTFILES/scripts/helpers.sh

print_stage "Installing GUI Applications"

# Install GNOME Tweak Tool
print_info "Installing GNOME Tweak Tool"
sudo apt -y install gnome-tweaks

# Install firefox
print_info "Installing Firefox"
# Remove snap version of firefox for performance reasons
sudo snap remove firefox
rm -rf ~/snap/firefox

sudo add-apt-repository ppa:mozillateam/ppa

# Ensure the PPA/deb/apt version of Firefox is preferred
echo '
Package: *
Pin: release o=LP-PPA-mozillateam
Pin-Priority: 1001
' | sudo tee /etc/apt/preferences.d/mozilla-firefox

# Firefox upgrades to be installed automatically
echo 'Unattended-Upgrade::Allowed-Origins:: "LP-PPA-mozillateam:${distro_codename}";' | sudo tee /etc/apt/apt.conf.d/51unattended-upgrades-firefox

sudo apt install -y firefox


# Install Spotify
print_info "Installing Spotify"
curl -sS https://download.spotify.com/debian/pubkey_7A3A762FAFD4A51F.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt update
sudo apt install -y spotify-client

# Install kitty
print_info "Installing kitty"
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
# Create symbolic links to add kitty and kitten to PATH (assuming ~/.local/bin is in
# your system-wide PATH)
ln -sf ~/.local/kitty.app/bin/kitty ~/.local/kitty.app/bin/kitten ~/.local/bin/
# Place the kitty.desktop file somewhere it can be found by the OS
cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
# If you want to open text files and images in kitty via your file manager also add the kitty-open.desktop file
cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/
# Update the paths to the kitty and its icon in the kitty.desktop file(s)
sed -i "s|Icon=kitty|Icon=/home/$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop
sed -i "s|Exec=kitty|Exec=/home/$USER/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop

#Install VSCode
print_info "Installing VS Code"
sudo apt-get install -y wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt install -y apt-transport-https
sudo apt update
sudo apt install -y code

# Install vlc
print_info "Installing VLC"
sudo apt install -y vlc

# Install postman
print_info "Installing Postman"
wget -O $TEMP/postman.tar.gz https://dl.pstmn.io/download/latest/linux64
sudo tar -xzf $TEMP/postman.tar.gz -C /opt
sudo ln -s /opt/Postman/Postman /usr/bin/postman
cat > ~/.local/share/applications/postman.desktop <<EOL
[Desktop Entry]
Encoding=UTF-8
Name=Postman
Exec=postman
Icon=/opt/Postman/app/resources/app/assets/icon.png
Terminal=false
Type=Application
Categories=Development;
EOL

# Install Obsidian
print_info "Installing Postman"
wget -O $TEMP/obsidian.deb https://github.com/obsidianmd/obsidian-releases/releases/download/v1.3.7/obsidian_1.3.7_amd64.deb
sudo apt install -y $TEMP/obsidian.deb

print_success "Done!"
