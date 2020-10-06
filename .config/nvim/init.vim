set runtimepath+=~/.vim
set packpath+=~/.vim

source ~/.vimrc

call plug#begin('~/.config/nvim/plugged')
  Plug 'nvim-treesitter/nvim-treesitter'
call plug#end()

lua require'plugins'

" Live substitution when using :substitute
set inccommand=nosplit

