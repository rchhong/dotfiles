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

# pandas, numpy, and others stuff
conda install pandas
pip install -U matplotlib


