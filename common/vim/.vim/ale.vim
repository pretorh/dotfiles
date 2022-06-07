let g:ale_sign_column_always = 0 " already have fold column, so displaying something already
let g:airline#extensions#ale#enabled = 1

" error formar: "message string here [linter name code]"
let g:ale_echo_msg_format = '%s [%linter% %code%]'

" highlight uses SpellBad (ALEError) and SpellCap (ALEWarnings)
" open list on errors, set height
let g:ale_open_list = 0
let g:ale_list_window_size = 2

" hover in floating window, utf-char borders
let g:ale_hover_to_floating_preview=1
let g:ale_floating_window_border=['│', '─', '╭', '╮', '╯', '╰', '│', '─']

" ge to Go next Error next errors
nmap <silent> ge <Plug>(ale_next_wrap)

" info
nnoremap <leader>lr <Plug>(ale_find_references)
nnoremap <S-K> <Plug>(ale_hover)

" navigation
nnoremap <leader>gd <Plug>(ale_go_to_definition_in_tab)

" actions
nnoremap <leader>rr <Plug>(ale_rename)
noremap <leader>rt :ALECodeAction<CR>
