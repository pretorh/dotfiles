:filetype plugin on
:syntax on

set shiftwidth=4
set tabstop=4
set autoindent
set expandtab

" line numbers
set number
set numberwidth=3

" column marker on right
:highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
hi LineNr ctermfg=50 ctermbg=34
set colorcolumn=110

" theme
syntax enable
set background=dark
colorscheme koehler
:highlight Normal ctermbg=black

" highlight extra whitespace
:highlight ExtraWhitespace ctermbg=darkred
:match ExtraWhitespace /\s\+$/

" matching paren color
highlight MatchParen cterm=bold ctermfg=cyan ctermbg=darkgrey

" keys
" http://vim.wikia.com/wiki/Smart_home
noremap <expr> <silent> <Home> col('.') == match(getline('.'),'\S')+1 ? '0' : '^'
imap <silent> <Home> <C-O><Home>
:iabbrev </ </<C-X><C-O>
" F3 = toggle highlight search
nnoremap <F3> :set hlsearch!<CR>
" F5 = make all bin targets (new tab, quit nerd tree, make)
nmap <F5> :tabe<CR>:q<CR>:make -k bin/*<CR>
" C-B like F5, but make all
nmap <C-B> :tabe<CR>:q<CR>:make -k all<CR>
" F6 = next build output details
nmap <F6> :cn<CR>

" start nerdtree on startup, every tab
" autocmd VimEnter * NERDTree
autocmd BufEnter * NERDTreeMirror

" search highlighting
:hi Search ctermfg=0 ctermbg=3

" enable highlight while typing
set incsearch
:hi IncSearch ctermfg=3 ctermbg=0 term=reverse
