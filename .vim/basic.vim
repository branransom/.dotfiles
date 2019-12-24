"""""""""""""""""""""""""
" General
"""""""""""""""""""""""""

" Sets how many lines of history VIM remembers
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader, it's possible to do extra key combos
" like <leader>w saves the current file
let mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" No annoying sounds on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500
set belloff=all

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

"""""""""""""""""""""""""
" VIM User Interface
"""""""""""""""""""""""""

" Always show current position
set ruler

" Show line numbers
set number

" Height of the command bar
set cmdheight=2

" Configure backspace so it acts as expected
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" Try to be smart about cases when searching
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance)
set lazyredraw

" For regular expressions, turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" Enable syntax highlighting
syntax enable

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

"""""""""""""""""""""""""""""""""""""""""""""
" Files, backups, and undo
"""""""""""""""""""""""""""""""""""""""""""""

" Turn backup files off
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""
" Text, tab, and indent related
"""""""""""""""""""""""""""""""""""""""""""""

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai " Auto indent
set si " Smart indent
set wrap " Wrap lines

"""""""""""""""""""""""""""""""""""""""""""""
" Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""

" Delete trailing white-space on save
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.js,*.sh,*.md :call CleanExtraSpaces()
endif

"""""""""""""""""""""""""""""""""""""""""""""
" Spell checking
"""""""""""""""""""""""""""""""""""""""""""""

" Pressing ,ss will toggle spell checking
map <leader>ss :setlocal spell!<cr>
