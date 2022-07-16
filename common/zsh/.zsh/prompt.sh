#!/usr/bin/env zsh

autoload -U promptinit && promptinit
setopt prompt_subst

_prompt_exit_status() {
    # red/green exit status
    echo "%(?.%{$fg[green]%}.%{$fg[red]%})%?"
}

_prompt_host() {
    # yellow host name
    local host="%{$fg[yellow]%}%M"

    if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
        # prefixed with SSH if ssh session
        echo "%F{white}%n%F{cyan}@%f$host"
    else
        echo "$host"
    fi
}

_prompt_pwd() {
    # cyan current dir (limit to last 3 levels)
    echo "%{$fg[cyan]%}%3~"
}

_prompt_input() {
    echo "%F{white}:%f"
}

_prompt_shell_level() {
    if [ -z $TMUX ] && [ $SHLVL -gt 1 ] ; then
        # not running tmux and SHLVL>1
        echo "%{$fg[cyan]%}[sh@$((SHLVL - 1))] "
    elif [ $SHLVL -gt 2 ] ; then
        # tmux is running in zsh, and zsh in tmux pane
        # works even when nested sh starts tmux (level still starts at 2 in tmux)
        echo "%{$fg[cyan]%}[sh@$((SHLVL - 2))] "
    fi
}

_prompt_last_command_time() {
    # shellcheck disable=SC2016
    echo '%(?.%{$fg[green]%}.%{$fg[red]%}:/ )% ${last_command_time}'
}

# combine
PROMPT="$(_prompt_exit_status) $(_prompt_shell_level)$(_prompt_host) $(_prompt_pwd) $(_prompt_input)%{$reset_color%} "

RPROMPT="$(_prompt_last_command_time)%{$reset_color%}"
