#!/usr/bin/env zsh

autoload -U promptinit && promptinit
setopt prompt_subst

# red/green exit status
_prompt_exit_status="%(?.%{$fg[green]%}.%{$fg[red]%})%?"

# yellow host name [prefixed with SSH if ssh session]
_prompt_host="%{$fg[yellow]%}%M"
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    _prompt_host="%{$fg[blue]%}[SSH] $_prompt_host"
fi

# cyan current dir (limit to last 3 levels)
_prompt_pwd="%{$fg[cyan]%}%3~"

# colon, trailing space
_prompt_char=" : "

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

# combine
PROMPT="$_prompt_exit_status $(_prompt_shell_level)$_prompt_host $_prompt_pwd%{$reset_color%}$_prompt_char"

# shellcheck disable=SC2034,1087,2154,SC2016
RPROMPT='%(?.%{$fg[green]%}.%{$fg[red]%}:/ )% ${last_command_time}%{$reset_color%}'
