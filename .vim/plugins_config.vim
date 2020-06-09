"""""""""""""""""""""""""""
" Powerline
"""""""""""""""""""""""""""

" Always show the status line
set laststatus=2

"""""""""""""""""""""""""""
" Polyglot
"""""""""""""""""""""""""""

" Always show the status line
let g:polyglot_disabled = ['graphql']

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

""""""""""""""""""""""
" CoC
""""""""""""""""""""""

" Make sure CoC uses compiled code
" let g:coc_force_debug = 1

" Install plugins globally
let g:coc_global_extensions = [
  \ 'coc-tsserver'
  \ ]

if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

nnoremap <silent> K :call CocAction('doHover')<CR>

" Show the diagnostic if it exists - otherwise, show the documentation
" I found this here: https://thoughtbot.com/blog/modern-typescript-and-react-development-in-vim
function! ShowDocIfNoDiagnostic(timer_id)
  if (coc#util#has_float() == 0)
    silent call CocActionAsync('doHover')
  endif
endfunction

function! s:show_hover_doc()
  call timer_start(500, 'ShowDocIfNoDiagnostic')
endfunction

autocmd CursorHoldI * :call <SID>show_hover_doc()
autocmd CursorHold * :call <SID>show_hover_doc()

" Goto actions
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)

" Navigate between errors
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Shows a list of diagnostics for the entire workspace
nnoremap <silent> <leader>d :<C-u>CocList diagnostics<cr>

" Perform automatic fix, such as importing
nmap <leader>do <Plug>(coc-codeaction)

" Rename a symbol
nmap <leader>rn <Plug>(coc-rename)

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

colorscheme gruvbox
