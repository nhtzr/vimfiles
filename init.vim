execute pathogen#infect()
execute pathogen#helptags()
set nocompatible
behave xterm

let $VIMTMP=expand('<sfile>:p:h') . "/vim_tmp"

" Most important
" Annoying sounds stop
set visualbell


set directory=$VIMTMP
set scrolloff=3
set history=50

set wildignorecase
set infercase
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
set noautoread
set foldlevel=9999

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

" Colors
set termguicolors
colorscheme spring-night
highlight LineNr guibg=NONE

let g:scratch_persistence_file=$VIMTMP . '/.scratch'
let g:scratch_no_mappings=1
let g:gitgutter_diff_base='HEAD'
let g:gitgutter_diff_args='-w'
let g:gitgutter_map_keys=0
let g:gitgutter_enabled=0
let g:airline_powerline_fonts = 1
let g:airline_theme = 'base16_tomorrow'

" set guifont=Sauce_Code_Powerline:h9:w5:cANSI
" set guioptions-=m
" set guioptions-=T

" <<Pressing shift is hard>> bindings
nnoremap ; :
vnoremap ; :
nnoremap @; @:
nnoremap , ;
vnoremap , ;

nnoremap Y y$
vnoremap Y $y

" Native copy bindings
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>p "+p
vnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>P "+P

vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

nnoremap Q qq
vnoremap q :normal <Right>
vnoremap Q :normal <Right>
vnoremap <silent> @ :normal @q<CR>

nnoremap zK zkzx
nnoremap zJ zjzx

" Settings bindings
nnoremap <silent> <leader>w :set wrap<CR>
nnoremap <silent> <leader>W :set nowrap<CR>
nnoremap <silent> <leader>v :set virtualedit=all<CR>
nnoremap <silent> <leader>V :set virtualedit=block<CR>

" Cleanup bindings
nnoremap <silent> <leader>st :%s/\s\+$//<CR>:nohlsearch<CR><C-L>``
nnoremap <silent> <leader>ss :s/\s\+/ /g<CR>:nohlsearch<CR><C-L>``

" Folding
nnoremap <silent> <leader>fmi :set foldmethod=indent<CR>
nnoremap <silent> <leader>fl0 :set foldlevel=0<CR>

" bash stuff
nnoremap <silent> <leader>opt :normal 0yt=I[ -n "${:-}" ] <Bar><Bar> F{p<CR>
vnoremap <silent> <leader>opt :normal 0yt=I[ -n "${:-}" ] <Bar><Bar> <C-V><Esc>F{p<CR>gv:Tabularize /] <Bar><Bar><CR>

" Gitgutter bindings
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk
omap ih <Plug>GitGutterTextObjectInnerPending
omap ah <Plug>GitGutterTextObjectOuterPending
xmap ih <Plug>GitGutterTextObjectInnerVisual
xmap ah <Plug>GitGutterTextObjectOuterVisual
nnoremap <silent> <leader>gga :GitGutterStageHunk<CR>
nnoremap <silent> <leader>ggr :GitGutterUndoHunk<CR>
nnoremap <silent> <leader>ggt :GitGutterToggle<CR>
nnoremap <silent> <leader>gg :GitGutter<CR>

" Scratch bindings
xnoremap <silent> gs :call scratch#selection(0)<cr>
nnoremap <silent> gs :call scratch#open(0)<cr>
nnoremap <silent> gS :call scratch#insert(0)<cr>

" Terminal remap
tnoremap <Esc> <C-\><C-n>
tnoremap <C-\> <Esc>

