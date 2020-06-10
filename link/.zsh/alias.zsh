# CD Shortcuts
alias cd..='cd ../'
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias ~='cd ~'

# Reload Terminal
alias reload='source ~/.zshrc'

# When nothing works
alias fkit='rm -rf node_modules/ && rm package-lock.json && yarn install'

# Change vim to nvim
alias oldvim="\\vim"
alias vim='nvim'
alias vi='nvim'

# Access common config files
alias ohmyzsh="~/.oh-my-zsh"
alias zshrc="vim ~/.zshrc"
alias vimrc="vim ~/.vimrc"
alias zshconfig="cd ~/.zsh"

# DL Youtube
alias dlaudio="youtube-dl --add-metadata --embed-thumbnail --extract-audio --audio-format mp3 -o '~/Music/%(artist)s - %(title)s.%(ext)s'"
alias dlvideo="youtube-dl --sub-lang en --add-metadata --write-sub -o '~/Videos/%(artist)s - %(title)s.%(ext)s'"

# Aliases for lazy people like me
# R only works when its capitalized 
alias r="R"
alias y='yarn'