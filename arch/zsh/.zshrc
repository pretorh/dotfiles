# alias
alias ls='ls --color=auto'
alias sso='xautolock -disable'          # disable screen locking
alias ssi='xautolock -enable'           # re-enable screen locking
alias vi="vim"
alias :q='exit'                         # vim like exit

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
export CHROME_BIN="chromium"
export PHANTOMJS_BIN="phantomjs"

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

# prompt
# red/green exit status
# yellow host name
# cyan current dir (limit to last 3 levels)
# reset color, colon, trailing space
PROMPT="%(?.%{$fg[green]%}.%{$fg[red]%})%? %{$fg[yellow]%}%M %{$fg[cyan]%}%3~ %{$reset_color%}: "
