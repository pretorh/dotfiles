# alias
alias ls='ls -G'    # colorized output
alias bc="bc -l"    # load mathlib with bc (scale to 20)
alias date=gdate
# cd up dirs
alias ..="cd .."
alias ...="cd ../.."

# git typos
alias gti="echo -e 'it is git, not gti\n' && git"

HISTFILE=~/.zsh/histfile
HISTSIZE=1000
SAVEHIST=1000
setopt HIST_IGNORE_DUPS

# android
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH="$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH"

# paths
export PATH="/usr/local/bin:$PATH"

# zsh
zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit
compinit

autoload -U compinit promptinit
promptinit

zstyle ':completion:*' menu select 'm:{a-z}={A-Z}'
setopt completealiases
bindkey -v

autoload -U colors && colors

source ~/.zsh/timing.sh

[ -d ~/.nix-profile ] && source ~/.nix-profile/etc/profile.d/nix.sh

# use lighter colors for ls in macos
if [ $(uname) = "Darwin" ] ; then
    export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
fi

# prompt
# red/green exit status
# yellow host name
# cyan current dir (limit to last 3 levels)
# reset color, colon, trailing space
PROMPT="%(?.%{$fg[green]%}.%{$fg[red]%})%? %{$fg[yellow]%}%M %{$fg[cyan]%}%3~ %{$reset_color%}: "

# The next line updates PATH for the Google Cloud SDK.
if [ -f ~/google-cloud-sdk/path.zsh.inc ]; then source ~/google-cloud-sdk/path.zsh.inc; fi
