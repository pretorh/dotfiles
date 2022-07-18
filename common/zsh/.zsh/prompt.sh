#!/usr/bin/env zsh

autoload -U promptinit && promptinit
setopt prompt_subst

_prompt_style_exit_code_ternary() {
    # print pass_text in green, fail_text in red, stay in green/red fg color
    local pass_text=$1
    local fail_text=$2
    echo "%(?.%F{green}$pass_text.%F{red}$fail_text)"
}

_prompt_exit_status() {
    echo "$(_prompt_style_exit_code_ternary)%?"
}

_prompt_exit_char() {
    echo "$(_prompt_style_exit_code_ternary ✓ ✗)"
}

_prompt_host() {
    # yellow host name
    echo "%{$fg[yellow]%}%M"
}

_prompt_host_if_remote() {
    if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
        # prefixed with SSH if ssh session
        echo "%F{white}%n%F{cyan}@$(_prompt_host_name)%f "
    fi
}

_prompt_pwd() {
    # cyan current dir (limit to last 3 levels)
    echo "%{$fg[cyan]%}%3~"
}

_prompt_input() {
    local prefix=''
    if [ ! -f "$HISTFILE" ] ; then
        prefix="$prefix🙈"
    fi

    echo "%F{white}$prefix%(#.#.:)%f"
}

_prompt_shell_level() {
    local level=0
    if [ -z $TMUX ] && [ $SHLVL -gt 1 ] ; then
        # not running tmux and SHLVL>1
        level=$((SHLVL - 1))
    elif [ $SHLVL -gt 2 ] ; then
        # tmux is running in zsh, and zsh in tmux pane
        # works even when nested sh starts tmux (level still starts at 2 in tmux)
        level=$((SHLVL - 2))
    else
        return
    fi

    echo "%F{white}[sh+$level] "
}

_prompt_last_command_time() {
    # shellcheck disable=SC2016
    echo '$(_prompt_style_exit_code_ternary "" ":/ ") ${last_command_time}'
}

_prompt_exit_and_command_time() {
    if [[ "$last_command_time" == "----" ]] ; then
        echo "$(_prompt_style_exit_code_ternary)%?"
    else
        echo "$(_prompt_style_exit_code_ternary)%? in ${last_command_time}"
    fi
}

# combine
# single quotes, to eval when expanded (else calculated once)
PROMPT='$(_prompt_exit_char) $(_prompt_shell_level)$(_prompt_host_if_remote)$(_prompt_pwd) $(_prompt_input)%{$reset_color%} '

RPROMPT='$(_prompt_exit_and_command_time)%{$reset_color%}'
