#!/bin/bash

DOTFILES=$HOME/.dotfiles
source $DOTFILES/scripts/shared/helpers.sh

print_stage "SYMBOLIC LINKING FILES"

# Backups
[[ ! -d "$DOTFILES/backup" ]] && mkdir -p $DOTFILES/backup

# Globbing for hidden files
shopt -s dotglob
total_public=$(ls -UbA1 ${DOTFILES}/link | wc -l)
total_private=$(ls -UbA1 ${DOTFILES}/link_private | wc -l)
total=total_public+total_private
setup_progress_bar total

#Make symlinks
linkDirPublic=$DOTFILES/link
cd $linkDirPublic
for i in $linkDirPublic/*; do
  to_install=$(echo $i | cut -d'/' -f6-)
  progress_bar "Installing $to_install"
  # Backup files if they already exist
  CONFLICTS=$(stow --no --verbose $to_install 2>&1 | awk '/\* existing target is/ {print $NF}')
	for filename in ${CONFLICTS[@]}; do
		if [[ -f $HOME/$filename || -L $HOME/$filename ]]; then
			echo "BACKUP: $filename"
			mv -f "$HOME/$filename" "$DOTFILES/backup/$filename"
		fi
	done
done

linkDirPrivate=$DOTFILES/link_private
cd $linkDirPrivate
for i in $linkDirPrivate/*; do
  to_install=$(echo $i | cut -d'/' -f6-)
  progress_bar "Installing $to_install (Private)"
done

progress_bar "Done!"
print_success "FINISHED SYMLINKING"
