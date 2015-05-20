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

# prompt
# red/green exit status
# yellow host name
# cyan current dir (limit to last 3 levels)
# reset color, colon, trailing space
PROMPT="%(?.%{$fg[green]%}.%{$fg[red]%})%? %{$fg[yellow]%}%M %{$fg[cyan]%}%3~ %{$reset_color%}: "
