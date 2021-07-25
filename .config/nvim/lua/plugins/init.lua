vim.cmd [[packadd packer.nvim]]

require('plugins/lsp')
require('plugins/treesitter')
require('plugins/completion')
require('plugins/telescope')

return require('packer').startup(function()
    
  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}

  -- LSP
  use { 'neovim/nvim-lspconfig' }
  use { 'glepnir/lspsaga.nvim' }

  -- Completion
  use { 'hrsh7th/nvim-compe' }

  -- Fuzzy finder
  use { 'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}} }

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'nvim-treesitter/playground' }

  -- Commenting hotkeys
  use { 'preservim/nerdcommenter' }

  -- Color scheme
  use { 'sainnhe/gruvbox-material' }

  -- Vim dispatch
  use { 'tpope/vim-dispatch' }

  -- Git
  use { 'tpope/vim-fugitive' }
  use { 'airblade/vim-gitgutter' }

  -- Illuminate word under cursor
  use { 'RRethy/vim-illuminate' }

  -- Hotkey helper
  use { 'folke/which-key.nvim' }

  -- Auto close parens, brackets, etc.
  use { 'jiangmiao/auto-pairs' }

  -- Hotkeys for surrounding text with parens, etc.
  use { 'tpope/vim-surround' }

  -- Status line
  use { 'itchyny/lightline.vim' }

  -- Filetree explorer
  use { 'kyazdani42/nvim-tree.lua' }

  -- Enable navigation across vim splits and tmux panes
  use { 'christoomey/vim-tmux-navigator' }

  -- Coding snippets
  use { 'mattn/emmet-vim' }

  -- Aligning text
  use { 'godlygeek/tabular' }

  -- Markdown
  use { 'plasticboy/vim-markdown' }
  use { "iamcco/markdown-preview.nvim", ft = "markdown", run = "cd app && yarn install" }

end)


