#!/usr/bin/env zsh

# not setting variables as https://superuser.com/a/478563/266008
# so only need to detect when the key map is changed
# KEYMAP resets on enter, so no need to listen for zle-line-finish (this
# also shows the mode when accepted, else it always changes to ins)
# similarly, C-c from cmd mode starts a new line, so no need to TRAPINT

setup_vi_mode() {
    function zle-keymap-select { zle reset-prompt }
    zle -N zle-keymap-select

    # explicit vi mode, shorter switch
    bindkey -v
    export KEYTIMEOUT=1
}

zsh_vi_mode_ternary() {
    local cmd_text=$1
    local ins_text=$2
    if [[ "$KEYMAP" == "vicmd" ]] ; then
        echo "$cmd_text"
    else
        echo "$ins_text"
    fi
}
