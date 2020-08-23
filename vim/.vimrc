" personal .vimrc file 
" put online to be accessible from everywhere
set nocompatible
filetype off

" style
set nu
syntax enable
set ai
set mouse=a

" use jj or jk to switch into command mode
inoremap jj <ESC>
inoremap jk <ESC>

" allow cursor position 1 character after last of line
set virtualedit=onemore

" UTF-8 standard encoding
set encoding=utf-8

" undo level set to 1000
set undolevels=1000

" When splitting vertically put the new window to the right
if has('vertsplit')
    set splitright
endif

" set ruler

if exists('+cursorline')
    set cursorline
endif

" highlight all matches when searching
set hlsearch

" highlight past column 80
let &colorcolumn=join(range(81,999),",")


" modeline support
setglobal modeline

"Plugin 'VundleVim/Vundle.vim'

"Plugin 'altercation/vim-colors-solarized'
"Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
"Plugin 'lervag/vimtex'
"Plugin 'majutsushi/tagbar'
"Plugin 'matze/vim-tex-fold'


filetype plugin indent on

" SOLARIZE IT!
" set background=dark
" colorscheme solarized


" vim-airline configuration
set laststatus=2
let g:airline_detext_modified=1
let g:airline_powerline_fonts=1
let g:airline_section_warning = ''


" for airline: tagbar
let g:airline#extensions#tagbar#enabled=0

" size of a hard tabstop
set tabstop=4
" size of an indent
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab

set backspace=indent,eol,start

au BufRead,BufNewFile *.asm set filetype=nasm

set clipboard=unnamed

" LaTeX stuff
" set spelllang=en_us spell
au BufRead,BufNewFile *.tex setlocal textwidth=80

" Display non-breakable space as "!".
set list
setl listchars=
if v:version >= 700
    set listchars+=nbsp:!
endif

" tab completion menu
set wildmenu

" highlight matching parentheses
set showmatch

