local utils = require('utils')

local cmd = vim.cmd
local indent = 2

cmd('syntax enable')
cmd('filetype plugin indent on')
cmd('au TextYankPost * lua vim.highlight.on_yank {on_visual = false}')
cmd('colorscheme gruvbox-material')
vim.g.gruvbox_material_background = 'soft'

utils.opt('b', 'expandtab', true)
utils.opt('b', 'shiftwidth', indent)
utils.opt('b', 'smartindent', true)
utils.opt('b', 'autoindent', true)
utils.opt('b', 'tabstop', indent)
utils.opt('b', 'softtabstop', indent)

utils.opt('w', 'number', true)
utils.opt('w', 'relativenumber', true)

utils.opt('o', 'hidden', true)
utils.opt('o', 'inccommand', 'nosplit')
utils.opt('o', 'ignorecase', true)
utils.opt('o', 'lazyredraw', true)
utils.opt('o', 'ruler', true)
utils.opt('o', 'scrolloff', 4 )
utils.opt('o', 'shiftround', true)
utils.opt('o', 'smarttab', true)
utils.opt('o', 'smartcase', true)
utils.opt('o', 'splitbelow', true)
utils.opt('o', 'splitright', true)
utils.opt('o', 'showmode', false)
utils.opt('o', 'swapfile', false)
utils.opt('o', 'wildmode', 'list:longest')
utils.opt('o', 'clipboard','unnamed,unnamedplus')
utils.opt('o', 'history', 500)
utils.opt('o', 'autoread', true)
utils.opt('o', 'updatetime', 300)
utils.opt('o', 'mouse', 'a')
utils.opt('w', 'scrolloff', 10)
utils.opt('o', 'cmdheight', 2)


