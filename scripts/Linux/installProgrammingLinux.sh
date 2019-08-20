#!/bin/bash

DOTFILES=$HOME/.dotfiles
source $DOTFILES/scripts/Shared/progressBar.sh 


toInstallApt=(
    openjdk-8-jre
    openjdk-8-jdk
    texlive-full
    python3-pip
    nodejs
    npm
)


toInstallNPM=(
    create-react-app
    react-native-cli
    nodemon
    express
    async
    pug
    handlebars
    sass
    mup
)

toInstallConda=(
    jupyterlab
    pandas
    seaborn
)

toInstallOther=(
    mongodb
    meteor
    miniconda
    cleanup
)

let n=0
let total=${#toInstallApt[@]}+${#toInstallNPM[@]}+${#toInstallConda[@]}+${#toInstallOther[@]}

#Install Mongodb
progressBar $n $total "Installing MongoDB"
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4
echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.0.list
sudo apt update
sudo apt-get install -y mongodb-org
sudo service mongod start
((n++))

# Install meteor
progressBar $n $total "Installing Meteor"
curl https://install.meteor.com/ | sh
((n++))

# Install Miniconda
progressBar $n $total "Installing Miniconda"
wget -O ~/Downloads/temp/miniconda.sh https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
chmod a+x ~/Downloads/temp/miniconda.sh
~/Downloads/temp/miniconda.sh  
((n++))

for i in "${toInstallApt[@]}"; do
	progressBar $n $total "Installing $i"
	sudo apt install $i
	((n++))
done


for i in "${toInstallNPM[@]}"; do
	progressBar $n $total "Installing $i"
	sudo npm install -g $i
	((n++))
done

for i in "${toInstallConda[@]}"; do
	progressBar $n $total "Installing $i"
	conda install $i
	((n++))
done

echo "Cleaning up!"
rm -r temp

progressBar $total $total "Done!"
echo ""

./settingsLinux.sh


