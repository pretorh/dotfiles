#!/usr/bin/env sh

ping_address=1.1.1.1

if kill -0 "$(cat ~/.tmux/.log/ping.pid)" ; then
    # consider the last 3 requests
    # anyone that has a sequence number (passed)
    # else we are offline
    # get the latest time of the 1 to 3 lines
    # get the msec
    (tail -n 3 ~/.tmux/.log/ping.log | grep icmp_seq || echo "offline") \
        | tail -n 1 \
        | sed 's|.*time=\(.*\)$|\1|'
else
    echo "starting"

    mkdir -p ~/.tmux/.log/
    ping $ping_address > ~/.tmux/.log/ping.log 2>&1  &
    echo "$!" > ~/.tmux/.log/ping.pid
fi
