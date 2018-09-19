source $HOME/.zsh/debug.sh

os_type=$(uname| tr '[:upper:]' '[:lower:]')

source $HOME/.zsh/aliases/cd.sh
source $HOME/.zsh/aliases/git.sh
source $HOME/.zsh/aliases/docker.sh

source $HOME/.zsh/history.sh

for command in $(ls -1 $HOME/.zsh/commands/{*.$os_type.sh,*.all.sh}) ; do
    _debug_log "sourcing $command"
    source $command
done

source $HOME/.zsh/paths.sh

# zsh
source $HOME/.zsh/auto-complete.sh

source ~/.zsh/timing.sh

source ~/.zsh/keys.$os_type.sh

source $HOME/.zsh/prompt.sh
