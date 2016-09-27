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
    if [ -z "$TIMER" -o -z "$LAST_CMD" ] ; then
        ELAPSED="----"
    else
        NOW=$(($(gdate +%s%N)/1000000))
        ELAPSED=$((NOW - TIMER));
        if [ $ELAPSED -lt 1000 ] ; then
            ELAPSED=$ELAPSED"ms"
        else
            SEC=`echo "scale=2; $ELAPSED/1000.0" | bc`
            if [ $ELAPSED -gt 60000 ] ; then
                MIN=`echo "scale=0; $ELAPSED/60000" | bc`
                SEC=`echo "scale=2; $SEC-$MIN*60" | bc`
                ELAPSED=$MIN"min "$SEC"sec"
            else
                ELAPSED=$SEC"sec"
            fi
        fi
    fi

    RPROMPT="%(?.%{$fg[green]%}.%{$fg[red]%}:/ )% ${ELAPSED} %{$reset_color%}"
    LAST_CMD=
}

function preexec () {
    TIMER=$(($(gdate +%s%N)/1000000))
    LAST_CMD=$1
}

# prompt
# red/green exit status
# yellow host name
# cyan current dir (limit to last 3 levels)
# reset color, colon, trailing space
PROMPT="%(?.%{$fg[green]%}.%{$fg[red]%})%? %{$fg[yellow]%}%M %{$fg[cyan]%}%3~ %{$reset_color%}: "
