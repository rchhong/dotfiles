#!/bin/bash

DOTFILES=$HOME/.dotfiles
source $DOTFILES/scripts/helpers.sh

print_stage "Installing terminal applications"

# Install Powerline Patched Fonts
print_info "Installing Powerline Patched Fonts"
sudo apt install fonts-powerline
print_success "Done!"

# Installing terminal-based tools
toDownload=(
    autojump
    curl
    fd-find
    ffmpeg
    fzf
    htop
    neofetch
    neovim
    pandoc
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

# tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# zsh completions
echo 'deb http://download.opensuse.org/repositories/shells:/zsh-users:/zsh-completions/xUbuntu_20.04/ /' | sudo tee /etc/apt/sources.list.d/shells:zsh-users:zsh-completions.list
curl -fsSL https://download.opensuse.org/repositories/shells:zsh-users:zsh-completions/xUbuntu_20.04/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/shells_zsh-users_zsh-completions.gpg > /dev/null
sudo apt update
sudo apt install zsh-completions

# starship prompt
curl -sS https://starship.rs/install.sh | sh

print_success "Done!"