echo `~/.tmux/status/rxtx.sh` \
     "|" \
     `~/.tmux/status/uptime.sh` \
     "| #H |" \
     `date --rfc-3339=sec`
