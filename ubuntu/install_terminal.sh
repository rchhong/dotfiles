#!/bin/bash

DOTFILES=$HOME/.dotfiles
source $DOTFILES/scripts/helpers.sh

print_stage "Installing terminal applications"

# Install Nerd Font
print_info "Installing Powerline Patched Fonts"
sudo apt -y install fontconfig
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
    jq
    lua5.1
    make
    neofetch
    pandoc
    pass
    poppler-utils
    ripgrep
    stow
    tesseract-ocr
    tldr
    tmux
    tree
    unzip
    vim
    imagemagick
    luarocks
    libmagickwand-dev
)

for i in "${toDownload[@]}"; do
	print_info "Installing $i"
	sudo apt install -y $i
done

# tmux
print_info "Installing tmux"
sudo apt-get install libevent-dev ncurses-dev build-essential bison pkg-config
wget -O tmux.tar.gz https://github.com/tmux/tmux/releases/download/3.3a/tmux-3.3a.tar.gz
tar -zxf tmux.tar.gz
cd tmux-*/
./configure
make && sudo make install
cd ..
rm -rf tmux.tar.gz tmux-*/
sudo apt autoremove


# neovim
print_info "Installing neovim"
wget -O nvim.tar.gz https://github.com/neovim/neovim/releases/download/v0.9.5/nvim-linux64.tar.gz
tar -xzvf nvim.tar.gz
mv -r nvim-linux64 /usr/local/bin/

# tmux plugin manager
print_info "Installing tmux plugin manager"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# starship prompt
print_info "Installing starship prompt"
curl -sS https://starship.rs/install.sh | sh

# Install rga
# TODO: Fix this hard code mess
print_info "Installing rga"
wget -O rga.tar.gz https://github.com/phiresky/ripgrep-all/releases/download/v1.0.0-alpha.5/ripgrep_all-v1.0.0-alpha.5-x86_64-unknown-linux-musl.tar.gz
tar -xzf rga.tar.gz -C .
sudo mv ./ripgrep_all*/rga* /usr/local/bin/

# Install github cli
print_info "Installing GitHub CLI"
type -p curl >/dev/null || (sudo apt update && sudo apt install curl -y)
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y

print_success "Done!"
