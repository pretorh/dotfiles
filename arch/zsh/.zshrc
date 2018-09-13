os_type=$(uname| tr '[:upper:]' '[:lower:]')

# alias
alias ls='ls --color=auto'
alias vi="vim"
alias bc="bc -l"                        # load mathlib with bc (scale to 20)

source $HOME/.zsh/aliases/cd.sh
source $HOME/.zsh/aliases/git.sh
source $HOME/.zsh/aliases/docker.sh

export EDITOR=vim

source $HOME/.zsh/history.sh

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

source $HOME/.zsh/keys.$os_type.sh

source $HOME/.zsh/auto-complete.sh
source $HOME/.zsh/timing.sh
source $HOME/.zsh/prompt.sh
