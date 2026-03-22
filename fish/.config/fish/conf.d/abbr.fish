if status is-interactive
    # Change vim to nvim
    abbr -a -- vim 'nvim'
    abbr -a -- vi 'nvim'

    # nvim directories
    abbr -a -- nvimdir 'cd ~/.config/nvim/'
    abbr -a -- nvimswap 'cd ~/.config/nvim/swp'
    abbr -a -- nvimundo 'cd ~/.config/nvim/undo'
    abbr -a -- nvimbackup 'cd ~/.config/nvim/tmp'

    # Access common config files
    abbr -a -- fishconfig 'cd ~/.config/fish'
    abbr -a -- dotfiles 'cd ~/.dotfiles'

    # Lazygit
    abbr -a -- lazygit 'LG_CONFIG_FILE="$HOME/.config/lazygit/config.yml,$HOME/.config/lazygit/theme.yml" lazygit'
end