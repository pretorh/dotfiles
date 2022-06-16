let g:airline_theme_patch_func = 'AirlineThemePatch'

function! AirlineThemePatch(palette)
  if g:airline_theme == 'jellybeans'
    for colors in values(a:palette.inactive)
      let colors[2] = 66  " lighter text color in inactive tabs
    endfor
    for colors in values(a:palette.normal)
      let colors[2] = 231   " use almost-white text color in normal mode (mainly for filename)
    endfor
  endif
endfunction

let g:airline_theme = 'jellybeans'

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#show_buffers = 0   " hides closed but not deleted buffers
let g:airline#extensions#tabline#tab_min_count = 2  " only show when 2+ tabs opened
let g:airline#extensions#tabline#show_close_button = 0
