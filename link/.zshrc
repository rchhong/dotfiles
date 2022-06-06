ZSH_FILES_DIRECTORY=$HOME/.zsh
for i in $ZSH_FILES_DIRECTORY/*; do
  source $i
done

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
