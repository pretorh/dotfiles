uptime 2>/dev/null | perl -pe 's/^.?\d:\d\d\s+(up\s.*),\s\d user.*$/\1/'
