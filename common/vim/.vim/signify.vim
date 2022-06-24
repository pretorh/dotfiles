" show hunk number when navigating to it
autocmd User SignifyHunk call s:show_current_hunk()
function! s:show_current_hunk() abort
  let h = sy#util#get_hunk_stats()
  if !empty(h)
    echo printf('[Hunk %d/%d]', h.current_hunk, h.total_hunks)
  endif
endfunction

" visual: select hunk
xmap sh <plug>(signify-motion-inner-visual)

" leader: diff, undo hunk
map <leader>df :SignifyDiff!<cr>
map <leader>hu :SignifyHunkUndo<cr>
