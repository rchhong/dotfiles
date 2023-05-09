#!/bin/bash

DOTFILES=$HOME/.dotfiles
source $DOTFILES/scripts/helpers.sh

print_stage "SYMBOLIC LINKING FILES"

# Backups
[[ ! -d "$DOTFILES/backup" ]] && mkdir -p $DOTFILES/backup

#Make symlinks
linkDirCommon=$DOTFILES/common/link
for i in $linkDirCommon/*; do
  to_install=$(echo $i | cut -d'/' -f7-)
  print_info "Installing $to_install"

  # Avoid conflicts
  CONFLICTS=$(stow --simulate  --no-folding --verbose -t ~ -d $linkDirCommon $to_install 2>&1 | awk '/\* existing target is/ {print $NF}')
	for filename in ${CONFLICTS[@]}; do
		if [[ -f $HOME/$filename || -L $HOME/$filename ]]; then
			echo "DELETE: $filename"
			rm -f "$HOME/$filename"
		fi
	done

  # Create symlinks
  stow --adopt --no-folding --verbose -t ~ -d $linkDirCommon $to_install
done

# Revert to my dotfiles
git restore .

print_success "FINISHED SYMLINKING"
