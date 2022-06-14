vim.cmd [[packadd packer.nvim]]

require('plugins/lsp')
require('plugins/treesitter')
require('plugins/completion')
require('plugins/telescope')
require('plugins/jupyter')
require('which-key').setup {}
require'nvim-tree'.setup {
  auto_close = true,
}

return require('packer').startup(function()

  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}

  -- LSP
  use { 'neovim/nvim-lspconfig' }
  use { 'glepnir/lspsaga.nvim' }
  use { 'ray-x/lsp_signature.nvim' }
  use { 'jose-elias-alvarez/nvim-lsp-ts-utils' }

  -- Completion
  use { 'hrsh7th/nvim-compe' }
  use { "hrsh7th/nvim-cmp",
      requires = {
  	{ "andersevenrud/cmp-tmux" },
  	{ "hrsh7th/cmp-buffer" },
  	{ "hrsh7th/cmp-path" },
  	{ "hrsh7th/cmp-nvim-lua" },
  	{ "hrsh7th/cmp-nvim-lsp" },
  	{ "saadparwaiz1/cmp_luasnip" },
  	{ "hrsh7th/cmp-cmdline" },
  	{ "octaltree/cmp-look" },
      },
      config = function()
  	local cmp = require "cmp"
  	cmp.setup {
  	    preselect = cmp.PreselectMode.None,
  	    completion = {
  		keyword_length = 0,
  		autocomplete = false,
  	    },

  	    mapping = {
  		["<C-d>"] = cmp.mapping.scroll_docs(-5),
  		["<C-f>"] = cmp.mapping.scroll_docs(5),
  		["<C-e>"] = cmp.mapping.close(),
  		["<CR>"] = function(fallback)
  		    if cmp.visible() then
  			return cmp.mapping.confirm {
  			    behavior = cmp.ConfirmBehavior.Insert,
  			    select = true,
  			}(fallback)
  		    else
  			return fallback()
  		    end
  		end,
  		["<C-n>"] = function(fallback)
  		    if cmp.visible() then
  			return cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert }(fallback)
  		    else
  			return cmp.mapping.complete { reason = cmp.ContextReason.Auto }(fallback)
  		    end
  		end,
  		["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
  	    },

  	    snippet = {
  		expand = function(args)
  		    require("luasnip").lsp_expand(args.body)
  		end,
  	    },

  	    sorting = {
  		priority_weight = 100,
  		comparators = {
  		    cmp.config.compare.offset,
  		    cmp.config.compare.exact,
  		    cmp.config.compare.score,
  		    cmp.config.compare.sort_text,
  		    cmp.config.compare.length,
  		    cmp.config.compare.order,
  		},
  	    },

  	    sources = {
  		{ name = "path", priority_weight = 110 },
  		{ name = "nvim_lsp", max_item_count = 20, priority_weight = 100 },
  		{ name = "nvim_lua", priority_weight = 90 },
  		{ name = "luasnip", priority_weight = 80 },
  		{ name = "buffer", max_item_count = 5, priority_weight = 70 },
  		{
  		    name = "rg",
  		    keyword_length = 5,
  		    max_item_count = 5,
  		    priority_weight = 60,
  		    option = {
  			additional_arguments = "--smart-case --hidden",
  		    },
  		},
  		{ name = "tmux", max_item_count = 5, option = { all_panes = false }, priority_weight = 50 },
  		{
  		    name = "look",
  		    keyword_length = 5,
  		    max_item_count = 5,
  		    option = { convert_case = true, loud = true },
  		    priority_weight = 40,
  		},
  	    },

  	    formatting = {
  		format = function(entry, vim_item)
  		    local menu_map = {
  			gh_issues = "[Issues]",
  			buffer = "[Buf]",
  			nvim_lsp = "[LSP]",
  			nvim_lua = "[API]",
  			path = "[Path]",
  			luasnip = "[Snip]",
  			tmux = "[Tmux]",
  			look = "[Look]",
  			rg = "[RG]",
  		    }
  		    vim_item.menu = menu_map[entry.source.name] or string.format("[%s]", entry.source.name)

  		    vim_item.kind = vim.lsp.protocol.CompletionItemKind[vim_item.kind]
  		    return vim_item
  		end,
  	    },

  	    experimental = {
  		native_menu = false,
  		ghost_text = true,
  	    },
  	}
  	cmp.setup.cmdline(":", {
  	    sources = {
  		{ name = "cmdline" },
  	    },
  	})
      end,
  }

  -- Fuzzy finder
  use { 'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}} }

  -- Treesitter
  use { 'nvim-treesitter/playground' }
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }

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

  -- Fancy start window
  use { 'mhinz/vim-startify' }

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
  use { 'iamcco/markdown-preview.nvim', run = function() vim.fn['mkdp#util#install']() end, ft = {'markdown'} }

end)
