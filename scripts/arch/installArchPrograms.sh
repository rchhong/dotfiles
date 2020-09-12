#!/bin/bash
DOTFILES=$HOME/.dotfiles
source $DOTFILES/scripts/shared/helpers.sh

toInstallPacman=(
  yay
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
  vim
  neovim
  yarn
  ripgrep
  gdb
  fzf
  neofetch
  jdk11-openjdk
  texlive-core
  texlive-latexextra
  jupyter
)


print_stage "INSTALLING PROGRAMS"

let n=0
let total=${#toInstallPacman[@]}+${#toInstallNPM[@]}+${#toInstallYay[@]}

for i in "${toInstallPacman[@]}"; do
	progressBar $n $total "Installing $i"
	pacman $i
	((n++))
done

# Run nvm to install npm
nvm install --lts

for i in "${toInstallNPM[@]}"; do
	progressBar $n $total "Installing $i"
	npm install -g $i
	((n++))
done

# Updating everything
yay -Syu

for i in "${toInstallYay[@]}"; do
	progressBar $n $total "Installing $i"
	yay $i
	((n++))
done

# Start mongodb service
systemctl enable mongodb

progressBar $total $total "Done!"
echo ""
