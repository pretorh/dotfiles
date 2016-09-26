HISTFILE=~/.zsh/histfile
HISTSIZE=1000
SAVEHIST=1000
setopt HIST_IGNORE_DUPS

# exports
export ANDROID_HOME=$HOME/Library/Android/sdk
zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit
compinit

autoload -U promptinit
promptinit

zstyle ':completion:*' menu select 'm:{a-z}={A-Z}'
setopt completealiases
bindkey -v

autoload -U colors && colors

# path
export PATH="/usr/local/bin:$PATH"
export PATH="$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH"

alias date=gdate

function precmd () {
    if [ -z "$TIMER" ] ; then
        ELAPSED="----"
    else
        NOW=$(($(gdate +%s%N)/1000000))
        ELAPSED=$((NOW - TIMER));
    fi

    RPROMPT="%(?.%{$fg[green]%}.%{$fg[red]%}:/ )% ${ELAPSED}ms %{$reset_color%}"
}

function preexec () {
    TIMER=$(($(gdate +%s%N)/1000000))
}

# prompt
# red/green exit status
# yellow host name
# cyan current dir (limit to last 3 levels)
# reset color, colon, trailing space
PROMPT="%(?.%{$fg[green]%}.%{$fg[red]%})%? %{$fg[yellow]%}%M %{$fg[cyan]%}%3~ %{$reset_color%}: "
