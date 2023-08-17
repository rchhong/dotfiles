#!/bin/bash

DOTFILES=$HOME/.dotfiles
TEMP=$DOTFILES/temp
source $DOTFILES/scripts/helpers.sh

# Settings
# For more modifications, run `dconf watch /` and see what changes
print_stage "Installing Settings"

# Disable Hot Corners
gsettings set org.gnome.desktop.interface enable-hot-corners false

# Change order of buttons in Window
gsettings set org.gnome.desktop.wm.preferences button-layout "close,minimize,maximize:"

# Show hidden files
gsettings set org.gnome.nautilus.preferences show-hidden-files true

# Move dock to bottom
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM

# Show battery percentage
gsettings set org.gnome.desktop.interface show-battery-percentage true

# Show day of the week
gsettings set org.gnome.desktop.interface clock-show-weekday true

# Dark theme
gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-dark'

# Enable some built-in extensions, don't want to load more cause work stuff
gsettings set org.gnome.shell enabled-extensions "['ubuntu-appindicators@ubuntu.com', 'ubuntu-dock@ubuntu.com']"

# Autohide dock
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false

# kitty as default terminal
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator `which kitty` 50
sudo update-alternatives --config x-terminal-emulator

# # Optional: Install this to move the clock to the left https://extensions.gnome.org/extension/2/move-clock/

# # Setup dock
gsettings set org.gnome.shell favorite-apps "['org.gnome.Nautilus.desktop', 'firefox.desktop', 'spotify.desktop', 'kitty.desktop', 'code.desktop', 'postman.desktop', 'obsidian.desktop']"

# print_success "Done!"
