require('plugins/lsp')
require('plugins/treesitter')
require('plugins/completion')
require('plugins/lspsaga')
require('plugins/telescope')

local whichKey = require("which-key")
whichKey.setup {}

-- Highlight line numbers where diagnostic errors are detected
vim.fn.sign_define("LspDiagnosticsSignError", {text = "", numhl = "LspDiagnosticsDefaultError"})
vim.fn.sign_define("LspDiagnosticsSignWarning", {text = "", numhl = "LspDiagnosticsDefaultWarning"})
vim.fn.sign_define("LspDiagnosticsSignInformation", {text = "", numhl = "LspDiagnosticsDefaultInformation"})
vim.fn.sign_define("LspDiagnosticsSignHint", {text = "", numhl = "LspDiagnosticsDefaultHint"})

