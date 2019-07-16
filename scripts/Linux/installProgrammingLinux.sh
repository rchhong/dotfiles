#!/bin/bash

source $DOTFILES/scripts/Shared/progressBar.sh 

# Install OpenJDK 8
sudo apt install openjdk-8-jre openjdk-8-jdk
# Install LaTeX
sudo apt install texlive-full
# Install pip
sudo apt install python3-pip
# Install nodejs
sudo apt install nodejs
# Install npm
sudo apt install npm


# Install react cli
sudo npm install -g create-react-app
# Install react native cli
sudo npm install -g react-native-cli
sudo npm install -g nodemon
sudo npm install -g express
sudo npm install -g async
sudo npm install -g pug
sudo npm install -g handlebars
sudo npm install -g sass
sudo npm install -g mup

#Install Mongodb
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4
echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.0.list
sudo apt update
sudo apt-get install -y mongodb-org
sudo service mongod start

# Install meteor
curl https://install.meteor.com/ | sh


# Install Miniconda
wget -O ~/Downloads/temp/miniconda.sh https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
chmod a+x ~/Downloads/temp/miniconda.sh
~/Downloads/temp/miniconda.sh  

# jupyter and jupyter themes
conda install -c conda-forge jupyterlab
pip install jupyterthemes
jt -t monokai

# pandas
conda install pandas


