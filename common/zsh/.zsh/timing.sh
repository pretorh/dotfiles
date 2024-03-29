#!/usr/bin/env zsh
# shellcheck shell=bash

# get nano second current time (https://stackoverflow.com/a/16548827/1016377)
# before execute (http://zsh.sourceforge.net/Doc/Release/Functions.html) and again
# before prompt. show the difference in the right prompt
# based on (for bash) http://jakemccrary.com/blog/2015/05/03/put-the-last-commands-run-time-in-your-bash-prompt/

if ! date +%s%N | grep -v "N" >/dev/null ; then
  echo -e "\033[1;33m.zshrc:\033[0m timing is not available" >&2
  ZSHRC_TIMING_NA=1
fi

calculate_command_timing() {
    if [ "$ZSHRC_TIMING_NA" = 1 ] ; then
        ELAPSED="N/A"
    elif [ -z "$TIMER" ] || [ -z "$LAST_CMD" ] ; then
        # no timer set, or no last command (likely a new prompt)
        ELAPSED="----"
    else
        NOW=$(($(date +%s%N)/1000000))
        ELAPSED=$((NOW - TIMER));
        if [ $ELAPSED -lt 1000 ] ; then
            # ZZZms
            ELAPSED=$ELAPSED"ms"
        else
            SEC=$(echo "scale=2; $ELAPSED/1000.0" | bc)
            if [ $ELAPSED -gt 60000 ] ; then
                # Xmin Y.YYsec
                MIN=$(echo "scale=0; $ELAPSED/60000" | bc)
                SEC=$(echo "scale=2; $SEC-$MIN*60" | bc)
                ELAPSED="$MIN""min ""$SEC""sec"
            else
                # Y.YYsec
                ELAPSED="$SEC""sec"
            fi
        fi
    fi

    LAST_CMD=
    export last_command_time=$ELAPSED
    unset ELAPSED
}

start_command_timing() {
  if [ -z "$ZSHRC_TIMING_NA" ] ; then
    TIMER=$(($(date +%s%N)/1000000))
    LAST_CMD=$1
  fi
}

preexec_functions+=( start_command_timing )
precmd_functions+=( calculate_command_timing )
