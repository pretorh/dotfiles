:filetype plugin on
:syntax on

set shiftwidth=4
set tabstop=4
set autoindent
set expandtab

" line numbers
set number
set numberwidth=3
set updatetime=250

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

" change line to comment in visual mode using: /
"  ^ return to beginning of text
"  <C-v> switch to visual block mode
"  I// to insert from visual block, adding //+space
"  escape to apply insert to all v-block lines
:vmap / ^<C-v>I// <Esc>

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

" lingering finger on shift when :qa
cabbrev Qa echoe 'you probably meant :qa?' \| sleep 400m \| qa

" maybe allow this based on keyboard
source ~/.vim/no-arrow-keys.vim

source ~/.vim/cursor.vim
" set shorter command timeout. useful with cursor, else there is a delay after switching insert -> normal
"   example from :help timeoutlen
:set timeout timeoutlen=3000 ttimeoutlen=100

" split panes to right and bottom
set splitbelow
set splitright

function s:OpenFileAtLastLocation()
  " from https://github.com/thoughtbot/dotfiles/blob/master/vimrc#L39
  if &filetype == 'gitcommit' || bufname("%")[len(bufname("%"))-19:] == '.git/COMMIT_EDITMSG'
    " filetype is (sometimes?) empty here, so also check the filename
    " not for git commit messages
  elseif &filetype == 'gitrebase' || bufname("%")[len(bufname("%"))-33:] == '.git/rebase-merge/git-rebase-todo'
    " not for git rebase messagess
  elseif line("'\"") < 0 || line("'\"") > line("$")
    " not when position is invalid
  else
    exe "normal g`\""
  endif
endfunction
autocmd BufReadPost * call s:OpenFileAtLastLocation()

source ~/.vim/plugins.vim
" plugin setup
source ~/.vim/airline.vim
source ~/.vim/ack-ag.vim
source ~/.vim/ale.vim
source ~/.vim/nerdtree.vim
source ~/.vim/ctrlp.vim
source ~/.vim/signify.vim

" set file types
autocmd BufNewFile,BufRead *.ts :set filetype=typescript
