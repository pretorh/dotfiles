#!/usr/bin/env zsh

export PATH="/usr/local/bin:$PATH"
export PATH="$PATH:$HOME/.local/bin";

# The next line updates PATH for the Google Cloud SDK.
if [ -f ~/google-cloud-sdk/path.zsh.inc ]; then source ~/google-cloud-sdk/path.zsh.inc; fi
