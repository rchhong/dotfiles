#!/bin/bash

DOTFILES=$HOME/.dotfiles
source $DOTFILES/scripts/shared/helpers.sh

print_stage "SYMLINKKING FILES"

#Symbolic Link all config files
toSymlinkFiles=(
	.bashrc
	.gitconfig
	.vimrc
	.zshrc
	.gitignore_global
  # .yabairc
  # .skhdrc
  # .tmux.conf
)

toSymlinkDirectories=(
	.config
  .vim
)

let n=0
let total=${#toSymlinkFiles[@]}+${#toSymlinkDirectories[@]}+1

# Backups
[ ! -d "$DOTFILES/backup" ] && mkdir -p $DOTFILES/backup

for i in "${toSymlinkFiles[@]}"; do
	progress_bar $n $total "Symlinking $i"
  if [[ -L ~/$i ]]; then
    print_error "ERROR: ~/$i HAS ALREADY BEEN SYMBOLIC LINKED"
  else
    [ -f ~/$i ] && mv ~/$i $DOTFILES/backup/$i
    ln -sf $DOTFILES/link/$i ~/$i
  fi
	((n++))
done

progress_bar $n $total "Symlinking .zsh"
if [[ -L $HOME/.zsh ]]; then
    print_error "ERROR: ~/.zsh/ HAS ALREADY BEEN SYMBOLIC LINKED"
else
  if [[ -d $HOME/.zsh ]]; then
    mkdir -p $DOTFILES/backup/.zsh
    mv $HOME/.zsh $DOTFILES/backup/.zsh
  fi
  ln -sf $DOTFILES/link/.zsh ~/.zsh
fi
((n++))

#Symbolic link ./.config

#Make directories
for i in "${toSymlinkDirectories[@]}"; do
	progress_bar $n $total "Symlinking $i"
    for j in $DOTFILES/link/$i/*/*; do
        relPath="$(echo $j | awk -F "/" '{ printf "%s/%s/%s", $6, $7, $8 }')"
        relPathBackOne="$(echo $j | awk -F "/" '{ printf "%s/%s", $6, $7}')"

        print_info "Symlinking $HOME/$relPath"

        if [[ -L $HOME/$relPath ]]; then
          print_error "ERROR: $HOME/$relPath has already been symbolic linked"
        else
          # Backup and then symbolic link
          [ ! -d "$HOME/$relPath" ] && mkdir -p $HOME/$relPathBackOne

          if [[ -d "$HOME/$relPath" ]]; then
            mkdir -p $DOTFILES/backup/$relPath
            [ -d $HOME/$relPath ] && mv $HOME/$relPath $DOTFILES/backup/$relPathBackOne
          elif [[ -f  "$HOME/$relPath" ]]; then
            mkdir -p $DOTFILES/backup/$relPathBackOne
            [ -f $HOME/$relPath ] && mv $HOME/$relPath $DOTFILES/backup/$relPath
          fi

          ln -sf $j $HOME/$relPath
        fi
    done

    for j in $DOTFILES/link/$i/*; do
        relPath="$(echo $j | awk -F "/" '{ printf "%s/%s/%s", $6, $7, $8 }')"
        relPathBackOne="$(echo $j | awk -F "/" '{ printf "%s/%s", $6, $7}')"
        # Backup and then symbolic link
        if [[ -f $j ]]; then
          print_info "Symlinking $HOME/$relPathBackOne"
          if [[ -L $HOME/$relPathBackOne ]]; then
            print_error "ERROR: $HOME/$relPath has already been symbolic linked"
          else
            if [[ -f  "$HOME/$relPath" ]]; then
              mkdir -p $DOTFILES/backup/$relPathBackOne
              [ -f $HOME/$relPath ] && mv $HOME/$relPath $DOTFILES/backup/$relPath
            fi
            ln -sf $j $HOME/$relPathBackOne
          fi
        fi
    done
done
((n++))

progress_bar $total $total "Done!"
print_success "FINISHED SYMLINKING"
