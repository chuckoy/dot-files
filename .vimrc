au FileType gitcommit setlocal tw=72 " set width in gitcommits to 72 for formatting purposes
filetype indent plugin on

" Python config
set tabstop=2 " number of spaces a tab should take up
set shiftwidth=2 " autoindent width
set expandtab " convert tabs to spaces

" Easier window navigation
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Right handed splitting
set splitright
set splitbelow

"
" Misc Settings
"

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set number " set line numbering
set relativenumber " set relative line numbering
set clipboard=unnamed " save yanks/dels to system clipboard as well
set hlsearch " highlight search terms
set ruler " ruler at bottom for row column position
syntax on " syntax highlighting on
set cul " underline current line
