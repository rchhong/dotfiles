export ZSH=$HOME/.oh-my-zsh
export SHELL=$(which zsh)

export DEFAULTS_PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
export RUBY_PATH=$(ruby -r rubygems -e 'puts Gem.user_dir')/bin:/usr/local/opt/ruby/bin
export RUST_PATH=$HOME/.cargo/env
# export DOTNET_PATH=$HOME/.dotnet
export FNM_PATH=$HOME/.local/share/fnm
export PNPM_HOME=$HOME/.local/share/pnpm
export GO_PATH=$(go env GOPATH)/bin

export PATH=$PATH:$DEFAULTS_PATH:$GO_PATH:$RUBY_PATH:$RUST_PATH:$FNM_PATH:$PNPM_HOME:/usr/local/bin/nvim-linux64/bin


export MANPATH="/usr/local/man:$MANPATH"

export BROWSER=firefox

# Needed for image.nvim
if [[ "$(uname)" == "Darwin" ]]; then
    export DYLD_LIBRARY_PATH=$(brew --prefix)/lib
fi


ZSH_THEME=""
