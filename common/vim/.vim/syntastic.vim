set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" use smaller location error list window
let g:syntastic_loc_list_height = 3

" add -x option to shellcheck to follow source files
let g:syntastic_sh_shellcheck_args = "-x"

" python
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_python_pylint_args = '--disable=C0111'
