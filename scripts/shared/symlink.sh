#!/bin/bash

DOTFILES=$HOME/.dotfiles
source $DOTFILES/scripts/shared/helpers.sh

print_stage "SYMBOLIC LINKING FILES"

function symlink_helper {
  # Am I a directory or file?
  if [[ -d $DOTFILES/link/${1} ]]
  then
    # Directory
    for i in $DOTFILES/link/${1}/*; do
      relPath=$(basename ${i})
      symlink_helper ${1}/${relPath}
    done
  else
    # File
    if [[ "${1}" != ".DS_Store" ]]; then
      print_info "Symlinking $HOME/${1}"
      dirName=$(dirname ${1})
      if [[ -L $HOME/${1} ]]; then
        print_error "ERROR: $HOME/${1} has already been symbolic linked"
      else
        [[ ! -d $HOME/${dirName} ]] && mkdir -p $HOME/${dirName}

        if [[ -f  $HOME/${1} ]]; then
          [[ ! -d $DOTFILES/backup/${dirName} ]] && mkdir -p $DOTFILES/backup/${2}
          [[ -f $HOME/${1} ]] && mv $HOME/${1} $DOTFILES/backup/${1}
        fi
        ln -sf $DOTFILES/link/${1} $HOME/${1}
      fi
    fi
  fi
}

# Backups
[[ ! -d "$DOTFILES/backup" ]] && mkdir -p $DOTFILES/backup

# Globbing for hidden files
shopt -s dotglob
total=$(ls -UbA1 ${DOTFILES}/link | wc -l)
setup_progress_bar total

#Make symlinks
linkDir=$DOTFILES/link
for i in $linkDir/*; do
  progress_bar "symlinking ${i}"
  symlink_helper $(basename ${i})
done

# symlink_helper .zsh

progress_bar "Done!"
print_success "FINISHED SYMLINKING"
