#!/bin/bash

DOTFILES=$HOME/.dotfiles
TEMP=$DOTFILES/temp
source $DOTFILES/scripts/helpers.sh

print_stage "Installing Developer Tools"

# Install fnm
print_info "Installing fnm"
curl -fsSL https://fnm.vercel.app/install | bash

# Install pnpm
print_info "Installing pnpm"
curl -fsSL https://get.pnpm.io/install.sh | sh -

# Install Miniconda
print_info "Installing miniconda"
wget -O $DOTFILES/temp/miniconda.sh https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
chmod a+x $DOTFILES/temp/miniconda.sh
$DOTFILES/temp/miniconda.sh

# Install micromamba
print_info "Installing micromamba"
"${SHELL}" <(curl -L micro.mamba.pm/install.sh)

# # Install AWS CLI
# print_info "Installing AWS CLI"
# curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "$TEMP/awscliv2.zip"
# unzip awscliv2.zip
# sudo ./aws/install

# # Install Azure CLI
# print_info "Installing Azure CLI"
# curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# # Install GCP CLI
# print_info "Installing GCP CLI"
# sudo apt-get update
# sudo apt-get install -y apt-transport-https ca-certificates gnupg curl sudo
# echo "deb https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
# curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
# sudo apt-get update && sudo apt-get install google-cloud-cli

# Install Docker
print_info "Installing Docker"
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Add current user to docker group (no more sudo with docker commands)
sudo groupadd docker
sudo usermod -aG docker $USER

echo "{ \
  "log-driver": "json-file", \
  "log-opts": { \
    "max-size": "10m", \
    "max-file": "3" \
  }\
}	" | sudo tee /etc/docker/daemon.json > /dev/null

# Start Docker on startup
sudo systemctl enable docker.service
sudo systemctl enable containerd.service

print_success "Done!"
