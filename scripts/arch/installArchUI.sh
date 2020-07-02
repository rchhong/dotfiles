#!/bin/bash
DOTFILES=$HOME/.dotfiles
source $DOTFILES/scripts/shared/helpers.sh

sudo -v

# Kvantium Theme Manager
yay -S kvantum-qt5-git
git clone https://github.com/Davide-sd/FlatBlur.git ~/.theme/

# McManjaro
yay -S mcmanjaro-kde-git
yay -S kvantum-qt5-git

# Papirus Icon Themes
yay -S papirus-icon-theme-git

# Make it so Meta key opens app drawer
kwriteconfig5 --file ~/.config/kwinrc --group ModifierOnlyShortcuts --key Meta "org.kde.lattedock,/Latte,org.kde.LatteDock,activateLauncherMenu"
qdbus org.kde.KWin /KWin reconfigure

print_info "RESTART COMPUTER AND GO INTO PLASMA SETTINGS TO FINISH SETTING UP"
