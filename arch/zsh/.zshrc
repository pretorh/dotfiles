# alias
alias ls='ls --color=auto'
alias vi="vim"
alias bc="bc -l"                        # load mathlib with bc (scale to 20)

source $HOME/.zsh/aliases/cd.sh
source $HOME/.zsh/aliases/git.sh

export EDITOR=vim

# history
HISTFILE=~/.zsh/histfile
HISTSIZE=1000
SAVEHIST=1000
setopt HIST_IGNORE_DUPS

if (uname -a | grep "Darwin" > /dev/null); then
    isDarwin=1
elif (uname -a | grep "ARCH" > /dev/null); then
    isArch=1
fi

# android
if [ $isDarwin ] ; then
    export ANDROID_HOME=$HOME/Library/Android/sdk
else
    export ANDROID_HOME=/opt/android-sdk
fi
export PATH="$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH"

# paths
export PATH=$PATH:$HOME/node_modules/bin:$HOME/local/bin/:$HOME/node_modules/.bin/
export PATH="$HOME/perl5/bin:$PATH";
export PATH="$HOME/.gem/ruby/2.3.0/bin:$PATH";
export PATH="$PATH:$HOME/.local/bin";
export CHROME_BIN="chromium"
export PHANTOMJS_BIN="phantomjs"

# perl
export PERL_LOCAL_LIB_ROOT="$PERL_LOCAL_LIB_ROOT:$HOME/perl5";
export PERL5LIB="$HOME/perl5/lib/perl5:$PERL5LIB"

[ $isArch ] && source $HOME/.zsh/os/arch.sh

zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit
compinit

autoload -U compinit promptinit
promptinit

zstyle ':completion:*' menu select 'm:{a-z}={A-Z}'
setopt completealiases
bindkey -v

autoload -U colors && colors

source $HOME/.zsh/prompt.sh
