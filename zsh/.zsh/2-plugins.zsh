if [[ -o interactive ]]; then
  # Completion system
  FPATH=$HOMEBREW_PREFIX/share/zsh-completions:$FPATH

  # Plugins (via Homebrew)
  source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  source $HOMEBREW_PREFIX/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

  autoload -Uz compinit
  # Only regenerate .zcompdump once per day
  if [[ -z "$ZSH_COMPDUMP" ]]; then
    ZSH_COMPDUMP="${ZDOTDIR:-$HOME}/.zcompdump"
  fi
  if [[ "$ZSH_COMPDUMP"(#qNmh-24) ]]; then
    compinit -C -d "$ZSH_COMPDUMP"
  else
    compinit -d "$ZSH_COMPDUMP"
  fi

  # Completion styling
  zstyle ':completion:*' menu select
  zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

  # Direnv hook
  if (( $+commands[direnv] )); then
    eval "$(direnv hook zsh)"
  fi

  # Sudo toggle (ESC-ESC)
  sudo-command-line() {
    [[ -z $BUFFER ]] && zle up-history
    if [[ $BUFFER == sudo\ * ]]; then
      LBUFFER="${LBUFFER#sudo }"
    else
      LBUFFER="sudo $LBUFFER"
    fi
  }
  zle -N sudo-command-line
  bindkey '\e\e' sudo-command-line
fi