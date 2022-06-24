let g:ctrlp_show_hidden = 1
" todo: try to read the .gitignore on startup, and set ctrlp_custom_ignore from it
" instead of using a custom command
" or add function/mapping to change the custom command
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
