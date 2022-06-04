"" setup vim-plug for plugins

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'vim-syntastic/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'mileszs/ack.vim'
Plug 'udalov/kotlin-vim'
Plug 'ianks/vim-tsx'
let g:ale_completion_enabled = 1    " set before ALE is loaded
Plug 'dense-analysis/ale'

" react & related
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'

call plug#end()
