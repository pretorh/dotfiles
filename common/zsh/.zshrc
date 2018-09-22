source $HOME/.zsh/debug.sh

os_type=$(uname | tr '[:upper:]' '[:lower:]')
_debug_log "zsh setup for $os_type"

source $HOME/.zsh/aliases/cd.sh
source $HOME/.zsh/aliases/git.sh
source $HOME/.zsh/aliases/docker.sh
for command in $(ls -1 $HOME/.zsh/commands/{*.$os_type.sh,*.all.sh}) ; do
    _debug_log "sourcing $command"
    source $command
done

source $HOME/.zsh/keys.$os_type.sh
source $HOME/.zsh/history.sh
source $HOME/.zsh/auto-complete.sh
source $HOME/.zsh/timing.sh
source $HOME/.zsh/prompt.sh

export EDITOR=vim
export PATH="$PATH:$HOME/.local/bin";
export PATH="/usr/local/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f ~/google-cloud-sdk/path.zsh.inc ]; then source ~/google-cloud-sdk/path.zsh.inc; fi
