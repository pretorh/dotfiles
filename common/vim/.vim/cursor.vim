" change cursor based in insert/normal mode
function s:SetupCursor()
    " https://ttssh2.osdn.jp/manual/4/en/usage/tips/vim.html
    let cursor_steady_vline = "\e[6 q"
    let cursor_steady_block = "\e[2 q"

    let &t_SI .= cursor_steady_vline   " insert
    let &t_EI .= cursor_steady_block   " default
endfunction
call s:SetupCursor()
