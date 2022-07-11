#!/usr/bin/env zsh

autoload -U promptinit && promptinit

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
