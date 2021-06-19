#!/usr/bin/env bash
set -e

command -v stow > /dev/null || (echo -e "\033[1;31mError\033[0m: GNU stow is not installed" >&2 && exit 1)

get_absolute_path() {
  realpath "$1" 2>/dev/null || { cd "$1" ; pwd ; }
}

dest="$(get_absolute_path "${DESTDIR:=$HOME}")"
echo "installing into $dest"

hook() {
  hook="$1"
  [ ! -x "$name/$hook.sh" ] && return

  echo "$name: $hook"
  "$name/$hook.sh" "$dest"
}

install_in_dir() {
  dird="$(dirname "$1")"
  name="$(basename "$1")"

  echo "$name ..."
  trap 'echo -e "$name \033[1;31m☓ failed\033[0m"' ERR
  pushd "$dird" >/dev/null
  hook "pre-install"
  stow --target "$dest" --verbose \
    --ignore '\.swp$' \
    --ignore '^(pre|post)-install.sh$' \
    "$name"
  hook "post-install"
  popd >/dev/null
  trap - ERR
  echo -e "$name \033[1;32m✓\033[0m"
}

for p in "$@" ; do
  install_in_dir "$p"
done
