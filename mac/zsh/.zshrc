os_type=$(uname| tr '[:upper:]' '[:lower:]')

# alias
alias ls='ls -G'    # colorized output
alias bc="bc -l"    # load mathlib with bc (scale to 20)
alias date=gdate

source $HOME/.zsh/aliases/cd.sh
source $HOME/.zsh/aliases/git.sh
source $HOME/.zsh/aliases/docker.sh

source $HOME/.zsh/history.sh

# android
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH="$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH"

# paths
export PATH="/usr/local/bin:$PATH"

# zsh
source $HOME/.zsh/auto-complete.sh

source ~/.zsh/timing.sh

[ -d ~/.nix-profile ] && source ~/.nix-profile/etc/profile.d/nix.sh

# use lighter colors for ls in macos
if [ $(uname) = "Darwin" ] ; then
    export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
fi

source ~/.zsh/keys.$os_type.sh

source $HOME/.zsh/prompt.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f ~/google-cloud-sdk/path.zsh.inc ]; then source ~/google-cloud-sdk/path.zsh.inc; fi
