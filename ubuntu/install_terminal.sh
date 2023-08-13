#!/bin/bash

DOTFILES=$HOME/.dotfiles
TEMP=$DOTFILES/temp/
source $DOTFILES/scripts/helpers.sh

print_stage "Installing terminal applications"

# Install Nerd Font
print_info "Installing Powerline Patched Fonts"
sudo apt install fontconfig
cd ~
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/Meslo.zip
mkdir -p .local/share/fonts
unzip Meslo.zip -d .local/share/fonts
cd .local/share/fonts
rm *Windows*
cd ~
rm Meslo.zip
fc-cache -fv

# Installing terminal-based tools
toDownload=(
    autojump
    curl
    fd-find
    ffmpeg
    fzf
    gcc
    htop
    lua5.3
    make
    neofetch
    neovim
    pandoc
    pass
    poppler-utils
    ripgrep
    stow
    tesseract-ocr
    tldr
    tmux
    tree
    vim
)

for i in "${toDownload[@]}"; do
	print_info "Installing $i"
	sudo apt install -y $i
done

# neovim
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim 

# tmux plugin manager
print_info "Installing tmux plugin manager"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# zsh completions
print_info "Installing zsh completions"
echo 'deb http://download.opensuse.org/repositories/shells:/zsh-users:/zsh-completions/xUbuntu_20.04/ /' | sudo tee /etc/apt/sources.list.d/shells:zsh-users:zsh-completions.list
curl -fsSL https://download.opensuse.org/repositories/shells:zsh-users:zsh-completions/xUbuntu_20.04/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/shells_zsh-users_zsh-completions.gpg > /dev/null
sudo apt update
sudo apt install zsh-completions

# starship prompt
print_info "Installing starship prompt"
curl -sS https://starship.rs/install.sh | sh

# Install rga
# TODO: Fix this hard code mess
print_info "Installing rga"
wget -O $TEMP/rga.tar.gz https://github.com/phiresky/ripgrep-all/releases/download/v1.0.0-alpha.5/ripgrep_all-v1.0.0-alpha.5-x86_64-unknown-linux-musl.tar.gz
tar -xzf $TEMP/rga.tar.gz
sudo mv $TEMP/ripgrep_all*/rga* /usr/local/bin/

# Install github cli
type -p curl >/dev/null || (sudo apt update && sudo apt install curl -y)
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y
sudo apt update
sudo apt install gh

# Install config files
$DOTFILES/scripts/link.sh -f bash conda fish git gpg kitty nvim ssh tmux vim zsh

print_success "Done!"