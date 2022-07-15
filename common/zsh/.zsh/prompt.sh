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

# combine
PROMPT="$_prompt_exit_status $_prompt_host $_prompt_pwd%{$reset_color%}$_prompt_char"

# shellcheck disable=SC2034,1087,2154,SC2016
RPROMPT='%(?.%{$fg[green]%}.%{$fg[red]%}:/ )% ${last_command_time}%{$reset_color%}'
