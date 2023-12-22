# CD Shortcuts
alias cd..='cd ../'
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias ~='cd ~'

# Reload Terminal
alias reload='source ~/.zshrc'

# Change vim to nvim
alias oldvim="\\vim"
alias vim='nvim'
alias vi='nvim'

# nvim directories
alias nvimdir='cd ~/.config/nvim/'
alias nvimswap='cd ~/.config/nvim/swp'
alias nvimundo='cd ~/.config/nvim/undo'
alias nvimbackup='cd ~/.config/nvim/tmp'

# Access common config files
alias ohmyzsh="~/.oh-my-zsh"
alias zshrc="vim ~/.zshrc"
alias vimrc="vim ~/.vimrc"
alias zshconfig="cd ~/.zsh"
alias dotfiles="cd ~/.dotfiles"

# DL Youtube
alias dlaudio="yt-dlp --add-metadata --embed-thumbnail --extract-audio --audio-format mp3 -o '~/Music/%(artist)s - %(title)s.%(ext)s'"
alias dlvideo="yt-dlp --sub-lang en --add-metadata --write-sub -o '~/Videos/%(artist)s - %(title)s.%(ext)s'"

# Aliases for lazy people like me
# R only works when its capitalized
alias r="R"
alias x="exit"
alias c="clear"
alias h='history|grep'
alias mamba='micromamba'
alias s='kitty +kitten ssh'

# Very annoying, disabled
alias sl="ls"

# QMK
alias lily58='cd ~/qmk_firmware/keyboards/lily58/keymaps/rchhong'
alias kbd67lite='cd ~/qmk_firmware/keyboards/kbdfans/kbd67/hotswap/keymaps/rchhong'
