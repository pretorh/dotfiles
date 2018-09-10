zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit
compinit

autoload -U compinit promptinit
promptinit

zstyle ':completion:*' menu select 'm:{a-z}={A-Z}'
setopt completealiases
bindkey -v

autoload -U colors && colors
