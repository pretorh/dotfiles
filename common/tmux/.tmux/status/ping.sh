#!/usr/bin/env sh

ping_address=1.1.1.1
pid_file=~/.tmux/.log/ping.pid
log_file=~/.tmux/.log/ping.log

if kill -0 "$(cat $pid_file)" ; then
    # consider the last 3 requests
    # anyone that has a sequence number (passed)
    # else we are offline
    # get the latest time of the 1 to 3 lines
    # get the msec
    (tail -n 3 $log_file | grep icmp_seq || echo "offline") \
        | tail -n 1 \
        | sed 's|.*time=\(.*\)$|\1|'
else
    echo "starting"

    mkdir -p ~/.tmux/.log/
    ping $ping_address > $log_file 2>&1  &
    echo "$!" > $pid_file
fi
