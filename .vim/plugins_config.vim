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

" Show preview of file in fzf
nnoremap <silent> <leader>o :call fzf#vim#files('', fzf#vim#with_preview('right'))<CR>

" :Find fuzzy searches for text in project files
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

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

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

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

""""""""""""""""""""""
" Vim Plain Colors
""""""""""""""""""""""

colorscheme plain
