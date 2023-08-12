#!/bin/bash
DOTFILES=$HOME/.dotfiles
source $DOTFILES/scripts/helpers.sh

usage='Usage: ./link.sh [-n] [-f] {private, common, osx, arch, ubuntu}

  -n   dry-run; no filesystem changes
  -f   force overwrite of existing symlinks'

DRY_RUN=0
FORCE=0

while getopts 'nf' opts
do
	case $opts in
		n ) DRY_RUN=1;;
		f ) FORCE=1;;
		* ) echo "$usage"
			exit 1;;
	esac
done
shift $((OPTIND-1))

#Make symlinks
for app in "$@";
do
  print_stage "Installing $app"

  link_dir="$DOTFILES/$app/link"
  for i in $link_dir/*; do
    to_install=$(echo $i | cut -d'/' -f7-)
    print_info "Installing $to_install"

    # Avoid conflicts
    CONFLICTS=$(stow --simulate --no-folding --verbose "$to_install" 2>&1 | awk '/\* existing target is/ {print $NF}')
    for filename in ${CONFLICTS[@]}; do
      if [[ -f $HOME/$filename || -L $HOME/$filename ]]; then
        if [[ FORCE -eq 1 ]];
        then
          echo "DELETE: $filename"
          rm -f "$HOME/$filename"
        else
          echo "Conflicted files detected, enable force option (-f) to delete."
        fi
      fi
    done

    if [[ $FORCE -eq 1 ]]; then RESTOW='--restow'; else RESTOW=''; fi
		if [[ $DRY_RUN -eq 1 ]]; then DR='--simulate'; else DR=''; fi
    # Create symlinks
    stow $RESTOW $DR --no-folding --verbose "$to_install"
  done
done

print_success "FINISHED SYMLINKING"
