# get nano second current time (https://stackoverflow.com/a/16548827/1016377)
# before execute (http://zsh.sourceforge.net/Doc/Release/Functions.html) and again
# before prompt. show the difference in the right prompt
# based on (for bash) http://jakemccrary.com/blog/2015/05/03/put-the-last-commands-run-time-in-your-bash-prompt/

precmd () {
    if [ -z "$TIMER" ] || [ -z "$LAST_CMD" ] ; then
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

    # [ green for success | red + frown for error ] [ elapsed time ]
    RPROMPT="%(?.%{$fg[green]%}.%{$fg[red]%}:/ )% ${ELAPSED} %{$reset_color%}"
    LAST_CMD=
}

preexec () {
    TIMER=$(($(date +%s%N)/1000000))
    LAST_CMD=$1
}
