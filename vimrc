" ============================
" start of frigidrain ~/.vimrc
" ============================

set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

" Install ag with this to use :Ag.
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Color schemes
Plug 'tomasr/molokai'
" Plug 'marcopaganini/mojave-vim-theme'

" Language syntax support
Plug 'vim-syntastic/syntastic'
" Plug 'lervag/vimtex.git'
" Plug 'leafgarland/typescript-vim.git'

" Enable this for scala syntax highlighting
"Plug 'derekwyatt/vim-scala.git'

call plug#end()

" Now we can turn our filetype functionality back on
filetype plugin indent on

" Set syntax highlighting for typescript
" autocmd BufRead,BufNewFile *.ts set syntax=typescript

" Syntastic highlight python3
let g:syntastic_python_python_exec = '/usr/bin/python3'

syntax on
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab

" For word wrapping
set tw=80
set formatoptions+=t

colorscheme molokai

" Make JJ equivalent to esc
imap jj <Esc>

" Grep within files using :Ag
map <C-M> :Ag<cr>

" Search for files using :Files
map <C-N> :Files<cr>

" Next/Prev tab
map <C-L> :tabn<cr>
map <C-H> :tabp<cr>
