#!/usr/bin/env zsh

autoload -U promptinit && promptinit
setopt prompt_subst

_prompt_style_exit_code_ternary() {
    # print pass_text in green, fail_text in red, stay in green/red fg color
    local pass_text=$1
    local fail_text=$2
    echo "%(?.%F{green}$pass_text.%F{red}$fail_text)"
}

_prompt_exit_status() {
    echo "$(_prompt_style_exit_code_ternary)%?"
}

_prompt_exit_char() {
    echo "$(_prompt_style_exit_code_ternary ✓ ✗)"
}

_prompt_host() {
    # yellow host name
    echo "%{$fg[yellow]%}%M"
}

_prompt_host_if_remote() {
    if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
        # prefixed with SSH if ssh session
        echo "%F{white}%n%F{cyan}@$(_prompt_host_name)%f "
    fi
}

_prompt_git_dir() {
    # this requires realpath with --relative-to support
    local git_root_dir
    if git_root_dir=$(git rev-parse --show-toplevel) 2>/dev/null ; then
        local git_parent_dir=$(basename "$git_root_dir")
        local dir_in_repo=$(realpath --relative-to "$git_root_dir" .)
        echo "%F{white}λ:%F{yellow}$git_parent_dir %F{cyan}$dir_in_repo"
        return 0
    fi

    return 1
}

_prompt_dir_git_or_pwd() {
    if git_dir_info=$(_prompt_git_dir) ; then
        echo "$git_dir_info"
    else
        echo "$(_prompt_pwd)"
    fi
}

_prompt_pwd() {
    # cyan current dir (limit to last 3 levels)
    echo "%{$fg[cyan]%}%3~"
}

_prompt_vi_mode() {
    # colors to match jellybean vim airline theme
    local cmd_color=25      # DeepSkyBlue4
    local ins_color=22      # DarkGreen
    # compact mode indicators. can use ' CMD ' (with spaces) for more verbose
    local cmd_text='cmd'
    local ins_text='ins'

    # bold white text in mode-determined background color
    echo "%B%F{white}%K$(zsh_vi_mode_ternary "{$cmd_color}$cmd_text" "{$ins_color}$ins_text")%k%f%b"
}

_prompt_input() {
    local prefix=''
    if [ ! -f "$HISTFILE" ] ; then
        prefix="$prefix🙈"
    fi

    echo "%F{white}$prefix%(#.#.:)%f"
}

_prompt_shell_level() {
    local level=0
    if [ -z $TMUX ] && [ $SHLVL -gt 1 ] ; then
        # not running tmux and SHLVL>1
        level=$((SHLVL - 1))
    elif [ $SHLVL -gt 2 ] ; then
        # tmux is running in zsh, and zsh in tmux pane
        # works even when nested sh starts tmux (level still starts at 2 in tmux)
        level=$((SHLVL - 2))
    else
        return
    fi

    echo "%F{white}[sh+$level] "
}

_prompt_last_command_time() {
    # shellcheck disable=SC2016
    echo '$(_prompt_style_exit_code_ternary "" ":/ ") ${last_command_time}'
}

_prompt_exit_and_command_time() {
    if [[ "$last_command_time" == "----" ]] ; then
        echo "$(_prompt_style_exit_code_ternary)%?"
    else
        echo "$(_prompt_style_exit_code_ternary)%? in ${last_command_time}"
    fi
}

# combine
# single quotes, to eval when expanded (else calculated once)
PROMPT='$(_prompt_exit_char) $(_prompt_shell_level)$(_prompt_host_if_remote)$(_prompt_dir_git_or_pwd) $(_prompt_vi_mode)$(_prompt_input)%{$reset_color%} '

RPROMPT='$(_prompt_exit_and_command_time)%{$reset_color%}'
