local utils = require('utils')

utils.map('n', '<C-l>', '<cmd>noh<CR>') -- Clear highlights
utils.map('v', '<leader>p', '"_dP') -- Paste from clipboard
utils.map('n', '<leader>y', '"+y') -- Copy to clipboard
utils.map('v', '<leader>y', '"+y') -- Copy to clipboard
utils.map('n', '<leader>Y', 'gg"+yG') -- Copy entire file to clipboard
utils.map('v', '<C-j>', ":m '>+1<CR>gv=gv'") -- Swap current line with line below
utils.map('v', '<C-k>', ":m '<-2<CR>gv=gv'") -- Swap current line with line above
utils.map('n', '<C-J>', '<C-W><C-J>') -- TMUX Navigation
utils.map('n', '<C-K>', '<C-W><C-K>') -- TMUX Navigation
utils.map('n', '<C-L>', '<C-W><C-L>') -- TMUX Navigation
utils.map('n', '<C-H>', '<C-W><C-H>') -- TMUX Navigation
utils.map('n', '<C-n>', '<cmd>NvimTreeToggle<CR>')
utils.map('n', '<leader>r', '<cmd>NvimTreeRefresh<CR>')

if vim.fn.exists(":Tabularize") then
  utils.map('n', '<leader>a=', ':Tabularize /=<CR>')
  utils.map('v', '<leader>a=', ':Tabularize /=<CR>')
  utils.map('n', '<leader>a:', ':Tabularize /:\zs<CR>')
  utils.map('v', '<leader>a:', ':Tabularize /:\zs<CR>')
end
