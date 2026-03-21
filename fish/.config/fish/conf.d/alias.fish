# CD Shortcuts
alias ...='cd ../../'
alias ....='cd ../../../'

# Reload Terminal
alias reload='source ~/.config/fish/config.fish'

# DL Youtube
alias dlaudio="yt-dlp --add-metadata --embed-thumbnail --extract-audio --audio-format mp3 -o '~/Music/%(artist)s - %(title)s.%(ext)s'"
alias dlvideo="yt-dlp --sub-lang en --add-metadata --write-sub -o '~/Videos/%(artist)s - %(title)s.%(ext)s'"

# Aliases for lazy people like me
# R only works when its capitalized
alias r="R"
alias x="exit"
alias c="clear"
alias h='history|grep'
alias k='kubectl'

# Very annoying, disabled
alias sl="ls"

# ls shows colors by default
alias ls="ls --color=always"

# tree
alias tree='eza --tree'