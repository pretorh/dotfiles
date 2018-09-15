os_type=$(uname| tr '[:upper:]' '[:lower:]')

source $HOME/.zsh/aliases/cd.sh
source $HOME/.zsh/aliases/git.sh
source $HOME/.zsh/aliases/docker.sh

export EDITOR=vim

source $HOME/.zsh/history.sh
source $HOME/.zsh/commands/_.all.sh
source $HOME/.zsh/commands/ls.$os_type.sh
source $HOME/.zsh/commands/android.$os_type.sh
source $HOME/.zsh/commands/clipboard.$os_type.sh
source $HOME/.zsh/commands/node.$os_type.sh
source $HOME/.zsh/commands/perl.$os_type.sh

export PATH="$PATH:$HOME/.local/bin";

source $HOME/.zsh/keys.$os_type.sh

source $HOME/.zsh/auto-complete.sh
source $HOME/.zsh/timing.sh
source $HOME/.zsh/prompt.sh
