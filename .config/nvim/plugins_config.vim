"""""""""""""""""""""""""""
" Completion
"""""""""""""""""""""""""""

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

" Matching strategy priority list
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

"""""""""""""""""""""""""""
" Diagnostic
"""""""""""""""""""""""""""

let g:diagnostic_enable_virtual_text = 1

"""""""""""""""""""""""""""
" Neoformat
"""""""""""""""""""""""""""

let g:neoformat_enabled_javascript = ['prettier']
augroup fmt
  autocmd!
  autocmd BufWritePre * Neoformat
augroup END

