source $HOME/.zsh/debug.sh
[ -f $HOME/.zprofile ] && source $HOME/.zprofile

os_type=$(uname | tr '[:upper:]' '[:lower:]')
_debug_log "zsh setup for $os_type"

autoload -U colors && colors
source ~/.zsh/vi-mode.sh &&
setup_vi_mode '2 q' '2 q' # cursort mode: block cursor for ins and cmd

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

function ssource {
    # quiet to not show encryption details
    # set pipefail to fail the command on gpg errors. use local_options to restore after function
    setopt local_options pipefail
    gpg --quiet --decrypt "$1" | source /dev/stdin && echo "sourced"
}

if [ -f /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] ; then
    # use https://github.com/zsh-users/zsh-syntax-highlighting if installed
    source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
