execute pathogen#infect()
execute pathogen#helptags()
set nocompatible
behave xterm

" Most important
" Annoying sounds stop
set visualbell

set directory=~/AppData/Roaming
set scrolloff=3
set history=50

set ignorecase
set smartcase

set number
set nowrap

set hlsearch
set showmatch

set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set linebreak

" FROM sensible.vim
set encoding=utf-8
set autoindent
set backspace=indent,eol,start
set incsearch
nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
set laststatus=2
set ruler
set showcmd
set wildmenu
set display+=lastline
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set hidden
"

syntax enable
filetype plugin indent on
color desert
let g:airline_powerline_fonts = 1
let g:airline_theme = 'base16_tomorrow'
" set guifont=Sauce_Code_Powerline:h9:w5:cANSI
" set guioptions-=m
" set guioptions-=T

nnoremap ; :
vnoremap ; :
nnoremap @; @:

nnoremap , ;
vnoremap , ;

nnoremap Y y$
vnoremap Y $y

nnoremap <leader>y "+y
vnoremap <leader>y "+y

nnoremap <leader>p "+p
vnoremap <leader>p "+p

nnoremap <leader>P "+P
vnoremap <leader>P "+P

vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

nnoremap Q qq
vnoremap <silent> Q :normal @q<CR>

nnoremap zK zkzx
nnoremap zJ zjzx

nnoremap <silent> <leader>w :set wrap<CR>
nnoremap <silent> <leader>W :set nowrap<CR>
nnoremap <silent> <leader>ve :set virtualedit=all<CR>
nnoremap <silent> <leader>nove :set virtualedit=block<CR>
nnoremap <silent> <leader>st :%s/\s\+$//<CR>:nohlsearch<CR><C-L><C-O><C-O>
nnoremap <silent> <leader>fdm :set foldmethod=indent<CR>


au BufNewFile,BufRead *.ahk set bomb