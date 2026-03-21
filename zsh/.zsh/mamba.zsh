if [[ "$(uname)" == "Darwin" ]]; then
    export MAMBA_EXE='/opt/homebrew/opt/micromamba/bin/mamba'
    export MAMBA_ROOT_PREFIX='/Users/ryanchhong/mamba'
elif [[ "$(uname)" == "Linux" ]]; then
    export MAMBA_EXE='/home/ryanc/.local/bin/micromamba'
    export MAMBA_ROOT_PREFIX='/home/ryanc/micromamba'
fi

# Lazy-load: run the shell hook on first use instead of at startup (~340ms cost)
_mamba_init() {
    unfunction mamba micromamba conda 2>/dev/null
    local __mamba_setup
    __mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2>/dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__mamba_setup"
    else
        alias mamba="$MAMBA_EXE"
        alias micromamba="$MAMBA_EXE"
    fi
    unset __mamba_setup
}

mamba() { _mamba_init && mamba "$@" }
micromamba() { _mamba_init && micromamba "$@" }
conda() { _mamba_init && conda "$@" }
