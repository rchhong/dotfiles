#!/bin/bash

DOTFILES=$HOME/.dotfiles
source $DOTFILES/scripts/shared/helpers.sh

# zsh default shell
chsh -s $(which zsh)

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install powerline10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k

# nvm
git clone https://github.com/lukechilds/zsh-nvm $ZSH_CUSTOM/plugins/zsh-nvm

# zsh autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions

# zsh syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

# TODO: Add auto copy of fonts

# Copy fonts
cp $DOTFILES/resources/fonts/*.ttf $HOME/.local/share/fonts

# Copy colorschemes
cp $DOTFILES/resources/colorthemes/*/*.colorscheme
