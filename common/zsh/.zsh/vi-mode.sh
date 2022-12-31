#!/usr/bin/env zsh

# not setting variables as https://superuser.com/a/478563/266008
# so only need to detect when the key map is changed
# KEYMAP resets on enter, so no need to listen for zle-line-finish (this
# also shows the mode when accepted, else it always changes to ins)
# similarly, C-c from cmd mode starts a new line, so no need to TRAPINT
# cursor setup based on https://github.com/Phantas0s/.dotfiles/blob/master/zsh/plugins/cursor_mode

setup_vi_mode() {
    cursor_code_ins=${1-'6 q'}
    cursor_code_cmd=${1-'2 q'}

    update_cursor() {
        echo -ne '\e['$(zsh_vi_mode_ternary "$cursor_code_cmd" "$cursor_code_ins")
    }
    function zle-keymap-select {
        update_cursor
        zle reset-prompt
    }
    zle -N zle-line-init update_cursor
    zle -N zle-keymap-select

    # explicit vi mode, shorter switch
    bindkey -v
    export KEYTIMEOUT=1

    # mimic minimal vim surround
    # from visual mode, S" do double quote selected
    # not added: delete-surround change-surround
    autoload -Uz surround
    zle -N add-surround surround
    bindkey -M visual S add-surround
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
