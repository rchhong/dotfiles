if status is-interactive
    for file in $HOME/.config/fish/config/*
        source $file
    end

    fish_config theme choose catppuccin-mocha --color-theme=dark
end