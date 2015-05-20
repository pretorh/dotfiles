# alias
alias ls='ls --color=auto'
alias sso='xautolock -disable'          # disable screen locking
alias ssi='xautolock -enable'           # re-enable screen locking
alias vi="vim"
alias :q='exit'                         # vim like exit

# history
HISTFILE=~/.zsh/histfile
HISTSIZE=1000
SAVEHIST=1000
setopt HIST_IGNORE_DUPS

# paths
export PATH=$PATH:$HOME/node_modules/bin:$HOME/local/bin/:/opt/android-sdk/tools/:$HOME/node_modules/.bin/
export PATH="$HOME/perl5/bin:$PATH";
export LD_LIBRARY_PATH=lib/:$HOME/local/libs/:./
export NODE_PATH=$HOME/data/node_modules/:$HOME/docs/codes/workcopy/

export PERL_LOCAL_LIB_ROOT="$PERL_LOCAL_LIB_ROOT:$HOME/perl5";
export PERL_MB_OPT="--install_base $HOME/perl5";
export PERL_MM_OPT="INSTALL_BASE=$HOME/perl5";
export PERL5LIB="$HOME/perl5/lib/perl5:$HOME/docs/codes/workcopy/perl-libs/:/media/truecrypt1/tools/lib/:$HOME/docs/codes/workcopy/file-copy-service/client/perl/:$PERL5LIB";
export CHROME_BIN="chromium"
export PHANTOMJS_BIN="phantomjs"

# fix keys
# http://zshwiki.org/home/zle/emacsandvikeys
# http://zshwiki.org/home/zle/bindkeys
unsetopt MULTIBYTE
bindkey -v
bindkey "^[OH" vi-beginning-of-line    # Home
bindkey "^[OF" vi-end-of-line          # End
bindkey '^[[3~' delete-char            # Del
bindkey "^[[1~" vi-beginning-of-line   # Home in tmux
bindkey "^[[4~" vi-end-of-line         # End in tmux

zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit
compinit

autoload -U compinit promptinit
promptinit

zstyle ':completion:*' menu select 'm:{a-z}={A-Z}'
setopt completealiases
bindkey -v

autoload -U colors && colors

# prompt
# red/green exit status
# yellow host name
# cyan current dir (limit to last 3 levels)
# reset color, colon, trailing space
PROMPT="%(?.%{$fg[green]%}.%{$fg[red]%})%? %{$fg[yellow]%}%M %{$fg[cyan]%}%3~ %{$reset_color%}: "
