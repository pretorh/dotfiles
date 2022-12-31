#!/usr/bin/env zsh

# generally based on/ideas from https://thevaluable.dev/zsh-completion-guide-examples/

zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit
compinit

setopt MENU_COMPLETE    # auto select the first match
setopt AUTO_PARAM_SLASH # use / not space when completing directory parameters
_comp_options+=(globdots)   # hidden files

# :completion:<function>:<completer>:<command>:<argument>:<tag>
zstyle ':completion:*' completer _extensions _complete _approximate # defined order of completers

# general setup
zstyle ':completion:*' verbose yes
zstyle ':completion:*' menu select
zstyle ':completion:*' group-name ''    # group by descriptions
zstyle ':completion:*:*:*:*:default' list-colors "fi=$color[white]" "di=$color[cyan]" "ex=$color[magenta]" # color files
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' # match upper case when lower typed (but not upper->lower)

# styling of completion menu
zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'

zstyle ':completion:*:*:-command-:*:*' group-order aliases builtins functions commands

setopt completealiases
bindkey -v
