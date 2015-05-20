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
