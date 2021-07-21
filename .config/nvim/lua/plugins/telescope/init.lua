local mapper = function(mode, key, result)
  vim.api.nvim_buf_set_keymap(0, mode, key, result, { noremap = true, silent = true })
end

mapper('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
mapper('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
mapper('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
mapper('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')
