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
    [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
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


