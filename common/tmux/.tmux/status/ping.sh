#!/usr/bin/env sh

ping_address=1.1.1.1

timeout_param='-w'
if [ "$(uname)" = 'Darwin' ] ; then
    timeout_param='-t'
fi

ping_time=$(ping $ping_address -c 1 $timeout_param 1 | grep icmp_seq || echo "offline")
ping_msec=$(echo "$ping_time" | sed 's|.*time=\(.*\)$|\1|')

echo "$ping_msec"
