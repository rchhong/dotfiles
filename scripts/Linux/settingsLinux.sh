#!/bin/bash

DOTFILES=$HOME/.dotfiles
source $DOTFILES/scripts/Shared/progressBar.sh 



# Settings Stuff
gsettings set org.gnome.shell enable-hot-corners false
gsettings set org.gnome.desktop.wm.preferences button-layout ":minimize,maximize,close"
gsettings set org.gnome.desktop.background picture-uri file:///$DOTFILES/media/bg.png
gsettings set org.gnome.desktop.screensaver picture-uri file:///$DOTFILES/media/lock.png

gsettings set org.gnome.shell favorite-apps ['org.gnome.Nautilus.desktop', 'gnome-control-center.desktop', 'org.gnome.tweaks.desktop', 'org.gnome.Terminal.desktop', 'google-chrome.desktop', 'code.desktop', 'discord.desktop', 'spotify.desktop', 'harmony.desktop', 'vlc.desktop', 'com.teamviewer.TeamViewer.desktop']

gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name 'Soft Lock'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command $HOME'/lock.sh'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding '<Super><Shift>L'
