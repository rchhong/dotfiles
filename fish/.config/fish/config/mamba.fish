# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba shell init' !!
set -gx MAMBA_EXE "/opt/homebrew/opt/micromamba/bin/mamba"
set -gx MAMBA_ROOT_PREFIX "/Users/ryanchhong/mamba"
$MAMBA_EXE shell hook --shell fish --root-prefix $MAMBA_ROOT_PREFIX | source
# <<< mamba initialize <<<