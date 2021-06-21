#!/usr/bin/env zsh
# shellcheck shell=bash

# history
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt HIST_IGNORE_DUPS

# ignore commands starting with space
setopt histignorespace
