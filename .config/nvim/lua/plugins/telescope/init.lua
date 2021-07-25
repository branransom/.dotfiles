local utils = require('utils')

local opts = { noremap = true, silent = true }

utils.map('n', '<leader>ff', '<cmd>Telescope find_files<cr>', opts)
utils.map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', opts)
utils.map('n', '<leader>fb', '<cmd>Telescope buffers<cr>', opts)
utils.map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', opts)
