" open when vim launched without any arguments
"  based on github faq example
autocmd StdinReadPre * let s:std_in=1
if argc() == 0 && !exists('s:std_in')
    autocmd VimEnter * NERDTree
endif

function NERDTreeCloseIfLastWindowInTab()
    if ! exists('b:NERDTree') || ! b:NERDTree.isTabTree()
        " no NERDTree or not open, no action
        return
    endif

    if tabpagenr('$') == 1
        return
    endif

    if winnr('$') == 1
        " todo: this is failing on arch
        try
            :NERDTreeClose
        catch
        endtry
    endif
endfunction

" close NERDTree if it is the last window in tab, but not if this is the last tab
autocmd BufEnter * :call NERDTreeCloseIfLastWindowInTab()

" auto mirror nerdtree if a new buffer is created, without nerdtree, and the file is readable, selecting the file
function NERDTreeAutoMirror()
    " skip the first buffer: it i setup via VimEnter (or skipped and should be
    " skipped here also)
    if winnr('$') == 1 && tabpagenr('$') > 1 && !exists('b:NERDTree') && filereadable(expand('%@'))
        :NERDTree   " ensure started
        silent :NERDTreeMirror
        :wincmd p
    endif
endfunction
autocmd BufEnter * :call NERDTreeAutoMirror()

function ToggleNERDTreeOnFindFile()
    :NERDTreeToggle
    if exists('b:NERDTree')
        " just opened nerdtree, toggle back to the file, find it
        silent :NERDTreeMirror
        :wincmd p
        silent :NERDTreeFind
    endif
endfunction

let NERDTreeShowHidden = 1
let NERDTreeIgnore = [ '\.git$', '.DS_Store', '\.*\.swp$', 'node_modules', '__pycache__' ]

map <F2> :call ToggleNERDTreeOnFindFile()<CR>
map <leader>ff :NERDTreeFind<CR>
