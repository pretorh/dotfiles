#!/usr/bin/env sh

b=$(dirname "$0")

if [ "$(uname)" = 'Darwin' ] ; then
  "$b"/mac-battery.sh
else
  echo "AC"
fi
