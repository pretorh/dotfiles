#!/usr/bin/env zsh

zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit
compinit

zstyle ':completion:*' menu select 'm:{a-z}={A-Z}'
setopt completealiases
bindkey -v
