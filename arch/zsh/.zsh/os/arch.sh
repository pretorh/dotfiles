# fix keys
# by using zsh /usr/share/zsh/functions/Misc/zkbd
# https://stackoverflow.com/a/10377906
# consider reading from ~/.zkbd files
unsetopt MULTIBYTE
bindkey -v
bindkey "^[[H" vi-beginning-of-line    # Home
bindkey "^[[F" vi-end-of-line          # End
bindkey '^[[3~' delete-char            # Del
bindkey "^[[2~" vi-insert              # Insert
bindkey "^[[1~" vi-beginning-of-line   # Home in tmux
bindkey "^[[4~" vi-end-of-line         # End in tmux
bindkey "^[[5~" vi-beginning-of-line   # page-up
bindkey "^[[6~" vi-end-of-line         # page-down

alias clip="xclip -selection clipboard"         # alias clip to xlip, write to "normal" clipboard
