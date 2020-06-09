set runtimepath+=~/.vim

call plug#begin('~/.vim/plugged')
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'junegunn/fzf'
  Plug 'jiangmiao/auto-pairs'
  Plug 'itchyny/lightline.vim'
  Plug 'morhetz/gruvbox'
  Plug 'preservim/nerdtree'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-surround'
  Plug 'christoomey/vim-tmux-navigator'
call plug#end()

source ~/.vim/plugins_config.vim
source ~/.vim/basic.vim

