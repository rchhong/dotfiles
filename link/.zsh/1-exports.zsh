export ZSH=$HOME/.oh-my-zsh
export ANDROID_HOME=$HOME/Android/Sdk

export DEFAULTS_PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
export CONDA_PATH=/$HOME/miniconda3/bin
export ANDROID_PATH=$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/tools:$ANDROID_HOME/emulator
export RUBY_PATH=/usr/local/lib/ruby/gems/2.7.0/bin:/usr/local/opt/ruby/bin

export PATH=$PATH:$RUBY_PATH:$DEFAULTS_PATH:$CONDA_PATH:$ANDROID_PATH:$HOME/Library/Python/3.8/bin:$HOME/.dotnet

export MANPATH="/usr/local/man:$MANPATH"

export NVM_LAZY_LOAD=true

export BROWSER=google-chrome-stable

ZSH_THEME="powerlevel10k/powerlevel10k"
