#!/usr/bin/env bash
set -e

command -v stow > /dev/null || (echo "GNU stow is not installed" && exit 1)

dest="$(realpath "${DESTDIR:=$HOME}")"
echo "installing into $dest"

mkdir -pv ~/.gnupg
mkdir -pv ~/.zsh

function install_in_dir() {
  dird="$(dirname "$1")"
  name="$(basename "$1")"

  pushd "$dird" >/dev/null
  stow --target "$dest" --verbose --ignore '\.swp$' "$name"
  popd >/dev/null
}

for p in "$@" ; do
  install_in_dir "$p"
done
