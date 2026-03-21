export SHELL=$(which zsh)

export DEFAULTS_PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
export RUST_PATH=$HOME/.cargo/env
export FNM_PATH=$HOME/.local/share/fnm
export PNPM_HOME=$HOME/.local/share/pnpm
export GO_PATH=$HOME/go/bin

export PATH=$PATH:$DEFAULTS_PATH:$GO_PATH:$RUST_PATH:$FNM_PATH:$PNPM_HOME


export MANPATH="/usr/local/man:$MANPATH"

export BROWSER=firefox

# Needed for image.nvim
if [[ "$(uname)" == "Darwin" ]]; then
    export DYLD_LIBRARY_PATH=/opt/homebrew/lib
fi


ZSH_THEME=""
