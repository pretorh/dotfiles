#!/usr/bin/env sh

battery=$(~/.tmux/status/battery.sh)
ping=$(~/.tmux/status/ping.sh)
now=$(date "+%Y-%m-%d %H:%M:%S")

echo "#H | $battery | $ping | $now"
