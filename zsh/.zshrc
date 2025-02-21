zmodload zsh/zprof

ZSH_FILES_DIRECTORY=$HOME/.zsh
for i in $ZSH_FILES_DIRECTORY/*; do
  source $i
done
# zprofeval "$(uv generate-shell-completion zsh)"
eval "$(uv generate-shell-completion zsh)"