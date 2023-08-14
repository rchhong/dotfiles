export ZSH=$HOME/.oh-my-zsh
export SHELL=$(which zsh)

export DEFAULTS_PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
export RUBY_PATH=/usr/local/lib/ruby/gems/2.7.0/bin:/usr/local/opt/ruby/bin
export RUST_PATH=$HOME/.cargo/env
export DOTNET_PATH=$HOME/.dotnet
export FNM_PATH=$HOME/.local/share/fnm

export PATH=$PATH:$RUBY_PATH:$DEFAULTS_PATH:$DOTNET_PATH:$RUST_PATH:$FNM_PATH

export MANPATH="/usr/local/man:$MANPATH"

export BROWSER=firefox

ZSH_THEME=""
