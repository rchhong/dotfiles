# CD Shortcuts
alias cd..='cd ../'
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'

# Reload Terminal
alias reload='source ~/.config/fish/config.fish'

# When nothing works
alias fkit='rm -rf node_modules/ && yarn install'

# Change vim to nvim
alias oldvim="\\vim"
alias vim='nvim'
alias vi='nvim'

# vim directories
alias vimdir='cd ~/.vim'
alias vimswap='cd ~/.vim/swp'
alias vimundo='cd ~/.vim/undo'
alias vimbackup='cd ~/.vim/tmp'

# Access common config files
alias vimrc="vim ~/.vimrc"
alias fishconfig="cd ~/.config/fish"
alias dotfiles="cd ~/.dotfiles"

# DL Youtube
alias dlaudio="yt-dlp --add-metadata --embed-thumbnail --extract-audio --audio-format mp3 -o '~/Music/%(artist)s - %(title)s.%(ext)s'"
alias dlvideo="yt-dlp --sub-lang en --add-metadata --write-sub -o '~/Videos/%(artist)s - %(title)s.%(ext)s'"

# Aliases for lazy people like me
# R only works when its capitalized
alias r="R"
alias y="yarn"
alias x="exit"
alias c="clear"
alias h='history|grep'
alias n='npm'

# QMK
alias lily58='cd ~/qmk_firmware/keyboards/lily58/keymaps/rchhong'
alias kbd67lite='cd ~/qmk_firmware/keyboards/kbdfans/kbd67/hotswap/keymaps/rchhong'
