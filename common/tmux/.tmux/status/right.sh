#!/usr/bin/env sh

battery=$(~/.tmux/status/battery.sh)
now=$(date "+%Y-%m-%d %H:%M:%S")

echo "#H | $battery $now"
