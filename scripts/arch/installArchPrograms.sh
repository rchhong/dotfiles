#!/bin/bash
DOTFILES=$HOME/.dotfiles
source $DOTFILES/scripts/shared/helpers.sh

toInstallPacman=(
  vim
  neovim
  yarn
  ripgrep
  gdb
  fzf
  neofetch
  yay
  sqlite
  jdk11-openjdk
  texlive-core
  texlive-latexextra
)

toInstallNPM=(
  react-native-cli
  typescript
  @angular/cli
)

toInstallYay=(
  google-chrome
  discord
  spotify
  visual-studio-code
  anydesk
  anki
  slack
  android-studio
  postman
  youtube-dl
  spicetify
  betterdiscordctl-git
  betterdiscordctl-rauenzi-git
)


print_stage "INSTALLING PROGRAMS"

let n=0
let total=${#toInstallPacman[@]}+${#toInstallNPM[@]}+${#toInstallYay[@]}

for i in "${toInstallApt[@]}"; do
	progressBar $n $total "Installing $i"
	sudo pacman -Syu $i
	((n++))
done

# Run nvm to install npm
nvm install --lts

for i in "${toInstallNPM[@]}"; do
	progressBar $n $total "Installing $i"
	npm install -g $i
	((n++))
done

for i in "${toInstallYay[@]}"; do
	progressBar $n $total "Installing $i"
	yay $i
	((n++))
done

# Start mongodb service
systemctl enable mongodb

progressBar $total $total "Done!"
echo ""
