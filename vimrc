set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree.git'
Plugin 'ctrlp.vim'
" Plugin 'SuperTab'
" Plugin 'delimitMate.vim'

" Color schemes
Plugin 'molokai'
" Plugin 'marcopaganini/mojave-vim-theme'
" Plugin 'morhetz/gruvbox'
" Plugin 'NLKNguyen/papercolor-theme'

" Language syntax support
Plugin 'scrooloose/syntastic.git'
" Plugin 'lervag/vimtex.git'
" Plugin 'leafgarland/typescript-vim.git'

" Enable this for scala syntax highlighting
"Plugin 'derekwyatt/vim-scala.git'

call vundle#end()

" Now we can turn our filetype functionality back on
filetype plugin indent on

set noeb vb t_vb=
set t_Co=256

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
" colorscheme mojave

" Make JJ equivalent to esc
imap jj <Esc>

" Toggle NERDTree with Ctrl-N
map <C-N> :NERDTreeToggle<cr>

" Next/Prev tab
map <C-L> :tabn<cr>
map <C-H> :tabp<cr>

" Skip to the end of line
inoremap <C-I> <ESC>%%a

" let delimitMate_expand_cr = 1
