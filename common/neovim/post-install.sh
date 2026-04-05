#!/usr/bin/env sh
set -e
dest=$1

real_config_dir="$dest/.config/nvim"

if [ -L "$real_config_dir" ] ; then
  echo "$real_config_dir is already sym linked"
elif [ -d "$real_config_dir" ] ; then
  rmdir "$real_config_dir"
  ln -sv "$dest/.nvim" "$real_config_dir"
fi
