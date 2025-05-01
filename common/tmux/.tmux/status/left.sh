#!/usr/bin/env bash
# based on https://stackoverflow.com/a/15308651/1016377

# prefix key used: set left-status background to black
echo -n '#{?client_prefix,#[bg=black],}'

# finally the session name
echo '#{=4:session_name} '
