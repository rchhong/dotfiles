if [ -f "/etc/arch-release" ]; then
    # Setup fzf
    # if [[ ! "$PATH" == */usr/share/fzf/* ]]; then
      # export PATH="${PATH:+${PATH}:}/usr/local/opt/fzf/bin"
    # fi

    # Auto-completion
    [[ -d "/usr/share/fzf" ]] && source "/usr/share/fzf/completion.zsh"

    # Key bindings
    [[ -d "/usr/share/fzf" ]] && source "/usr/share/fzf/key-bindings.zsh"
else
    # Setup fzf
    # if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
      # export PATH="${PATH:+${PATH}:}/usr/local/opt/fzf/bin"
    # fi

    # Auto-completion
    [[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null

    # Key bindings
    if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
        source "/usr/local/opt/fzf/shell/key-bindings.zsh"
    fi
fi

# Pick right one
if type "ag" > /dev/null; then
    # echo "AG chosen"
    export FZF_DEFAULT_COMMAND='ag -l --silent --hidden --ignore-case --skip-vcs-ignores'
fi

if type "rg" > /dev/null; then
    # echo "RG chosen"
    export FZF_DEFAULT_COMMAND='rg --files --no-messages --ignore-case --no-heading --hidden --follow --no-ignore-vcs -g "!{node_modules,.git}"'
fi


