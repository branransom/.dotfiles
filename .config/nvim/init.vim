set runtimepath+=~/.vim
set packpath+=~/.vim

source ~/.vimrc

call plug#begin('~/.config/nvim/plugged')
  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'
  Plug 'nvim-treesitter/nvim-treesitter'
  Plug 'neovim/nvim-lspconfig'
  Plug 'sbdchd/neoformat'
  Plug 'nvim-lua/completion-nvim'
call plug#end()

source ~/.config/nvim/plugins_config.vim

lua require'plugins'
lua require'lsp'

" Live substitution when using :substitute
set inccommand=nosplit

