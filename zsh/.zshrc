zmodload zsh/zprof

ZSH_FILES_DIRECTORY=$HOME/.zsh
for i in $ZSH_FILES_DIRECTORY/*; do
  source $i
done

# zprof

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fnm
export PATH="$HOME/.local/share/fnm:$PATH"
eval "`fnm env`"
