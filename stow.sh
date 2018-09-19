#!/usr/bin/env bash

set -e

command -v stow > /dev/null || (echo "GNU stow is not installed" && exit 1)

mkdir -pv ~/.gnupg
mkdir -pv ~/.zsh

function install_in_dir() {
    pushd "$1" >/dev/null
    for name in * ; do
        stow --target ~ --verbose --ignore '\.swp$' "$name"
    done
    popd >/dev/null
}

install_in_dir common
if [ ! -z "$1" ] ; then
    install_in_dir "$1"
fi
