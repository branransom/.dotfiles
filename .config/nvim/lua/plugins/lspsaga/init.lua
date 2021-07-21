local saga = require('lspsaga')
saga.init_lsp_saga()

local mapper = function(mode, key, result)
  vim.api.nvim_buf_set_keymap(0, mode, key, result, { noremap = true, silent = true })
end

mapper('n', '<silent>K', '<cmd>Lspsaga hover_doc<cr>')
mapper('n', '<silent>gh', '<cmd>Lspsaga lsp_finder<cr>')
mapper('n', '<silent>[e', '<cmd>Lspsaga diagnostic_jump_next<cr>')
mapper('n', '<silent>]e', '<cmd>Lspsaga diagnostic_jump_prev<cr>')
mapper('n', '<leader>act', '<cmd>Lspsaga code_action<cr>')
mapper('n', '<leader>act', '<cmd><C-U>Lspsaga range_code_action<cr>')
mapper('n', '<leader>rn', '<cmd>Lspsaga rename<cr>')
