#!/usr/bin/env bash
DOTFILES=$HOME/.dotfiles
source $DOTFILES/scripts/shared/helpers.sh

# Ask for sudo
sudo -v

print_stage "INSTALLING HOMEBREW AND ZSH STUFF"
# oh my zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# powerline10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k

# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

print_stage "INSTALLING PROGRAMS AND TERMINAL TOOLS"
brew bundle --file brewfile
brew bundle --file caskfile
brew bundle --file masfile
code --install-extension Shan.code-settings-sync

print_stage "INSTALLING CONDA PACKAGES"
conda install jupyterlab
conda install pandas
conda config --set auto_activate_base false

print_stage "INSTALLING ZSH PLUGINS"
# fzf file completion
$(brew --prefix)/opt/fzf/install

# nvm
git clone https://github.com/lukechilds/zsh-nvm $ZSH_CUSTOM/plugins/zsh-nvm

# zsh autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions

# zsh syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
