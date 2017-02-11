function precmd () {
    if [ -z "$TIMER" -o -z "$LAST_CMD" ] ; then
        ELAPSED="----"
    else
        NOW=$(($(gdate +%s%N)/1000000))
        ELAPSED=$((NOW - TIMER));
        if [ $ELAPSED -lt 1000 ] ; then
            ELAPSED=$ELAPSED"ms"
        else
            SEC=`echo "scale=2; $ELAPSED/1000.0" | bc`
            if [ $ELAPSED -gt 60000 ] ; then
                MIN=`echo "scale=0; $ELAPSED/60000" | bc`
                SEC=`echo "scale=2; $SEC-$MIN*60" | bc`
                ELAPSED=$MIN"min "$SEC"sec"
            else
                ELAPSED=$SEC"sec"
            fi
        fi
    fi

    RPROMPT="%(?.%{$fg[green]%}.%{$fg[red]%}:/ )% ${ELAPSED} %{$reset_color%}"
    LAST_CMD=
}

function preexec () {
    TIMER=$(($(gdate +%s%N)/1000000))
    LAST_CMD=$1
}
