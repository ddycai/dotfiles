set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'molokai'
Plugin 'scrooloose/nerdtree.git'
Plugin 'ctrlp.vim'
Plugin 'SuperTab'
Plugin 'delimitMate.vim'

" Now we can turn our filetype functionality back on
filetype plugin indent on

set t_Co=256

syntax on
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab

" For word wrapping
set tw=100
set formatoptions+=t

colorscheme molokai

" Make JJ equivalent to esc
imap jj <Esc>

" Toggle NERDTree with Ctrl-N
map <F2> :NERDTreeToggle<cr>

" Next/Prev tab
map <C-L> :tabn<cr>
map <C-H> :tabp<cr>

" Skip to the end of line
inoremap <C-I> <ESC>%%a

let delimitMate_expand_cr = 1

" Populate .java file:
autocmd BufNewFile *.java
 \ exe "normal O/** " . expand('%:t:r')".java\n/\npublic class " . expand('%:t:r') .
 \ " {\n\tpublic " . expand('%:t:r')"() {\n\n}\n} \<Esc>1G"
