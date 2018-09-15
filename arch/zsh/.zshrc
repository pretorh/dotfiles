source $HOME/.zsh/debug.sh

os_type=$(uname| tr '[:upper:]' '[:lower:]')

source $HOME/.zsh/aliases/cd.sh
source $HOME/.zsh/aliases/git.sh
source $HOME/.zsh/aliases/docker.sh

export EDITOR=vim

source $HOME/.zsh/history.sh

for command in $(ls -1 $HOME/.zsh/commands/{*.$os_type.sh,*.all.sh}) ; do
    _debug_log "sourcing $command"
    source $command
done

export PATH="$PATH:$HOME/.local/bin";

source $HOME/.zsh/keys.$os_type.sh

source $HOME/.zsh/auto-complete.sh
source $HOME/.zsh/timing.sh
source $HOME/.zsh/prompt.sh
