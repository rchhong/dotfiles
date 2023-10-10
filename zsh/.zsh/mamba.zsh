if [[ "$(uname)" == "Darwin" ]]; then
    # >>> mamba initialize >>>
    # !! Contents within this block are managed by 'mamba init' !!
    export MAMBA_EXE='/opt/homebrew/opt/micromamba/bin/micromamba';
    export MAMBA_ROOT_PREFIX='/Users/ryanchhong/micromamba';
    __mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__mamba_setup"
    else
        alias micromamba="$MAMBA_EXE"  # Fallback on help from mamba activate
    fi
    unset __mamba_setup
    # <<< mamba initialize <<<
elif [[ "$(uname)" == "Linux" ]]; then
    __conda_setup="$('/home/ryanc/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/home/ryanc/miniconda3/etc/profile.d/conda.sh" ]; then
            . "/home/ryanc/miniconda3/etc/profile.d/conda.sh"
        else
            export PATH="/home/ryanc/miniconda3/bin:$PATH"
        fi
    fi
    unset __conda_setup
fi