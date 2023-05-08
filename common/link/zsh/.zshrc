zmodload zsh/zprof

ZSH_FILES_DIRECTORY=$HOME/.zsh
for i in $ZSH_FILES_DIRECTORY/*; do
  source $i
done

export GPG_TTY=$(tty)

eval "$(fnm env --use-on-cd)"
# zprof
