#!/usr/bin/env bash
DOTFILES=$HOME/.dotfiles
source $DOTFILES/scripts/shared/helpers.sh

# Ask for sudo
sudo -v

print_stage "INSTALLING HOMEBREW"
# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/ryanchhong/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

print_stage "INSTALLING PROGRAMS AND TERMINAL TOOLS"
brew bundle --file brewfile
brew bundle --file caskfile
brew bundle --file masfile
# TODO: Start yabai + skhd services
# tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

print_stage "INSTALLING CONDA PACKAGES"
conda install -c conda-forge radian
conda config --set auto_activate_base false

print_stage "INSTALLING ZSH PLUGINS"
# oh my zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# fzf file completion
$(brew --prefix)/opt/fzf/install

# zsh autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions

# zsh syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

# Fixes tlmgr issues
"/usr/local/texlive/$(ls -d /usr/local/texlive/ |head -n 1)/bin/universal-darwin/tlmgr" path add

# TODO: increase the granlarity level
print_stage "INSTALLING CONFIG FILES"
$DOTFILES/scripts/link.sh kitty raycast skhd yabai

