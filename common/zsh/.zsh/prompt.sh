# prompt
# red/green exit status
# yellow host name [prefixed with SSH if ssh session]
# cyan current dir (limit to last 3 levels)
# reset color, colon, trailing space
LOGIN_FROM=""
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    LOGIN_FROM="[SSH] "
fi
PROMPT="%(?.%{$fg[green]%}.%{$fg[red]%})%? %{$fg[blue]%}$LOGIN_FROM%{$fg[yellow]%}%M %{$fg[cyan]%}%3~ %{$reset_color%}: "
