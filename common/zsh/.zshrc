source $HOME/.zsh/debug.sh

os_type=$(uname | tr '[:upper:]' '[:lower:]')
_debug_log "zsh setup for $os_type"

autoload -U colors && colors
source ~/.zsh/vi-mode.sh && setup_vi_mode

source $HOME/.zsh/aliases/cd.sh
source $HOME/.zsh/aliases/git.sh
source $HOME/.zsh/aliases/docker.sh

export EDITOR=vim

source $HOME/.zsh/history.sh

for command in $(ls -1 $HOME/.zsh/commands/{*.$os_type.sh,*.all.sh}) ; do
    _debug_log "sourcing $command"
    source $command
done

source $HOME/.zsh/paths.sh

source $HOME/.zsh/keys.$os_type.sh

source $HOME/.zsh/auto-complete.sh
source $HOME/.zsh/timing.sh
source $HOME/.zsh/prompt.sh
