#!/usr/bin/env sh

ping_time=$(ping -c 1 1.1.1.1 -t 1 | grep time || echo "offline")
ping_msec=$(echo "$ping_time" | sed 's|.*time=\(.*\)$|\1|')

echo "$ping_msec"
