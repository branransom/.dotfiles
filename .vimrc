set runtimepath+=~/.vim

call plug#begin('~/.vim/plugged')
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'jiangmiao/auto-pairs'
  Plug 'itchyny/lightline.vim'
  Plug 'morhetz/gruvbox'
  Plug 'preservim/nerdtree'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-surround'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'mattn/emmet-vim'
call plug#end()

" With a map leader, it's possible to do extra key combos
" like <leader>w saves the current file
let mapleader = ","

source ~/.vim/plugins_config.vim
source ~/.vim/basic.vim

