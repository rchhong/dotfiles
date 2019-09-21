#!/bin/bash

DOTFILES=$HOME/.dotfiles
source $DOTFILES/scripts/Shared/progressBar.sh 

echo "Installing Applications"

toInstall=(
    chrome
    spotify
    discord
    vscode
    teamviewer
    vlc
    postman
    androidstudio
    spicetify-cli
    betterdiscord-cli
)

let n=0
let total=${#toInstall[@]}

# Install Google Chrome
progressBar $n $total "Installing Google Chrome"
wget -O ~/Downloads/temp/chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ~/Downloads/temp/chrome.deb
((n++))

# Install Spotify
progressBar $n $total "Installing Spotify"
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt update
sudo apt install spotify-client
((n++))

# Install Discord
progressBar $n $total "Installing Discord"
wget -O ~/Downloads/temp/discord.deb https://discordapp.com/api/download?platform=linux&format=deb
sudo apt install ~/Downloads/temp/discord.deb
((n++))

#Install VSCode
progressBar $n $total "Installing Visual Studio Code"
wget -O ~/Downloads/temp/vscode.deb https://go.microsoft.com/fwlink/?LinkID=760868
sudo apt install ~/Downloads/temp/vscode.deb
code --install-extension Shan.code-settings-sync
echo "Remember to set up VS Code Settings Sync and fix powerline font\n"
((n++))

# Install Teamviewer
progressBar $n $total "Installing TeamViewer"
wget -O ~/Downloads/temp/teamviewer.deb https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
sudo apt install ~/Downloads/temp/teamviewer.deb
((n++))

# Install vlc
progressBar $n $total "Installing VLC"
sudo apt install vlc
((n++))

# Install postman
progressBar $n $total "Installing Postman"
wget -O ~/Downloads/temp/postman.tar.gz https://dl.pstmn.io/download/latest/linux64 
sudo tar -xzf ~/Downloads/temp/postman.tar.gz -C /opt
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
((n++))

# Install Android Studio
progressBar $n $total "Installing Android Studio"
sudo apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386
wget -O ~/Downloads/temp/androidstudio.tar.gz https://dl.google.com/dl/android/studio/ide-zips/3.4.2.0/android-studio-ide-183.5692245-linux.tar.gz
sudo tar -xzf ~/Downloads/temp/androidstudio.tar.gz -C /opt
((n++))

#Install spicetify-cli
progressBar $n $total "Installing Spicetify CLI"
wget -O ~/Downloads/temp/spicetify.tar.gz https://github.com/khanhas/spicetify-cli/releases/download/v0.9.2/spicetify-0.9.2-linux-amd64.tar.gz
mkdir ~/spicetify
tar xzf ~/Downloads/temp/spicetify.tar.gz -C ~/spicetify
sudo ln -s ~/spicetify/spicetify /usr/bin/spicetify
sudo chmod 777 /usr/share/spotify -R
echo "Remember to set up spicetify later"
((n++))

#Install betterdiscord-cli
progressBar $n $total "Installing BetterDiscord CLI"
wget -O ~/Downloads/temp/betterdiscordctl https://raw.githubusercontent.com/bb010g/betterdiscordctl/master/betterdiscordctl
sudo chmod +x ~/Downloads/temp/betterdiscordctl
mv ~/Downloads/temp/betterdiscordctl /usr/local/bin
echo "Remember to set up better discord later"
progressBar $total $total "Done!"
echo ""


./installProgrammingLinux.sh
