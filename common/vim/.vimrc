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

" error/warning highlights
highlight SpellCap cterm=none ctermbg=Red ctermfg=white
highlight SpellBad cterm=bold ctermbg=DarkRed ctermfg=white

" tab line colors
:hi TabLineFill cterm=bold ctermfg=4 ctermbg=7
:hi TabLine     cterm=bold ctermfg=4 ctermbg=7
:hi TabLineSel  cterm=bold ctermfg=7 ctermbg=4

" highlight extra whitespace
:highlight ExtraWhitespace ctermbg=darkred
:match ExtraWhitespace /\s\+$/

" show commands in right corner
set showcmd

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

" code folding
set foldmethod=indent
set foldlevel=2
set foldcolumn=2

" set backspace (https://stackoverflow.com/a/11560415/1016377)
:set backspace=indent,eol,start

" bind ctrl-J to pretty print as json
map <C-J> :%!python -m json.tool<CR>

" search highlighting
:hi Search ctermfg=0 ctermbg=3

" enable highlight while typing
set incsearch
:hi IncSearch ctermfg=3 ctermbg=0 term=reverse

" detect all files that start with Dockerfile as dockerfiles
autocmd BufRead,BufNewFile Dockerfile* setf Dockerfile

" loop {c,l}{next,prev}
" https://vi.stackexchange.com/a/8535
command! Cnext try | cnext | catch | cfirst | catch | endtry
command! Cprev try | cprev | catch | clast | catch | endtry
command! Lnext try | lnext | catch | lfirst | catch | endtry
command! Lprev try | lprev | catch | llast | catch | endtry
cabbrev cnext Cnext
cabbrev cprev CPrev
cabbrev lnext Lnext
cabbrev lprev Lprev

source ~/.vim/plugins.vim
" plugin setup
source ~/.vim/airline.vim
source ~/.vim/ack-ag.vim
source ~/.vim/ale.vim
source ~/.vim/nerdtree.vim

" set file types
autocmd BufNewFile,BufRead *.ts :set filetype=typescript
