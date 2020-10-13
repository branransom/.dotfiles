"""""""""""""""""""""""""""
" Powerline
"""""""""""""""""""""""""""

" Always show the status line
set laststatus=2

"""""""""""""""""""""""""""
" NERDTree
"""""""""""""""""""""""""""

let g:NERDTreeWinPost = "left"
let NERDTreeShowHidden = 1
let g:NERDTreeWinSize = 35
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
map <leader>nn :NERDTreeToggle %<cr>

" Automatically open NERDTree when vim is started
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Automatically close vim if NERDTree is last open window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"""""""""""""""""""""""""""
" FZF
"""""""""""""""""""""""""""

set rtp+=/usr/local/opt/fzf

" Fuzzy search files by name with preview window
nnoremap <silent> <leader>o :call fzf#vim#files('', fzf#vim#with_preview('right'))<CR>

" :Find fuzzy searches for text in project files
nnoremap <silent> <leader>f :Find<CR>
command! -bang -nargs=* Find 
        \ call fzf#vim#grep(
        \ 'rg
        \ --column
        \ --line-number
        \ --no-heading
        \ --fixed-strings
        \ --ignore-case
        \ --no-ignore
        \ --hidden 
        \ --follow 
        \ --glob "!{.git,node_modules}/*"
        \ --color "always" '.shellescape(<q-args>),
        \1, fzf#vim#with_preview(), <bang>0)

""""""""""""""""""""""
" Vim Plain Colors
""""""""""""""""""""""

colorscheme gruvbox
