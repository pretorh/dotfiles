HISTFILE=~/.zsh/histfile
HISTSIZE=1000
SAVEHIST=1000
setopt HIST_IGNORE_DUPS

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh
ZSH_THEME="robbyrussell"

# aliases
alias datef="date +%Y-%m-%d"        # iso std date
alias :q="exit"                     # vim like exit

# path
export PATH="/usr/local/bin:$PATH"

# prompt
# red/green exit status
# yellow host name
# cyan current dir (limit to last 3 levels)
# reset color, colon, trailing space
PROMPT="%(?.%{$fg[green]%}.%{$fg[red]%})%? %{$fg[yellow]%}%M %{$fg[cyan]%}%3~ %{$reset_color%}: "
