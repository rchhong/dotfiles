# Setup fzf
# ---------
if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/usr/local/opt/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/usr/local/opt/fzf/shell/key-bindings.zsh"

# Pick right one
if type "ag" > /dev/null; then
    export FZF_DEFAULT_COMMAND='ag -l --hidden'
fi

if type "rg" > /dev/null; then
    export FZF_DEFAULT_COMMAND='rg --files --ignore-case --no-heading --hidden -g "!.git"'
fi


