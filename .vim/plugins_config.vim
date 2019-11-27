"""""""""""""""""""""""""""
" Powerline
"""""""""""""""""""""""""""

" Always show the status line
set laststatus=2

"""""""""""""""""""""""""""
" NERDTree
"""""""""""""""""""""""""""

let g:NERDTreeWinPost = "left"
let NERDTreeShowHidden = 0
let g:NERDTreeWinSize = 35
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
map <leader>nn :NERDTreeToggle<cr>

" Automatically open NERDTree when vim is started
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"""""""""""""""""""""""""""
" FZF
"""""""""""""""""""""""""""

set rtp+=/usr/local/opt/fzf

"""""""""""""""""""""""""""
" VIM Multiple Cursors
"""""""""""""""""""""""""""

let g:multi_cursor_use_default_mapping=0

let g:multi_cursor_start_word_key      = '<C-d>'
let g:multi_cursor_select_all_word_key = '<A-d>'
let g:multi_cursor_start_key           = 'g<C-d>'
let g:multi_cursor_select_all_key      = 'g<A-d>'
let g:multi_cursor_next_key            = '<C-d>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

"""""""""""""""""""""""""""
" ALE
"""""""""""""""""""""""""""

" Enable prettier for JS
let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'css': ['prettier'],
\}

" Only run specified linters
let g:ale_linters_explicit = 1

" Run prettier on save
let g:ale_fix_on_save = 1

let g:ale_javascript_prettier_use_local_config = 1

""""""""""""""""""""""
" CoC
""""""""""""""""""""""

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
