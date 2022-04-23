local treesitter = require('nvim-treesitter.configs')

treesitter.setup {
    ensure_installed = "maintained",
    highlight = {
        enable = true,
        language_tree = true,
        additional_vim_regex_highlighting = { "org" },
    },
    indent = {
        enable = true,
    },
    refactor = {
        highlight_definitions = {
            enable = true,
        },
    },
    autotag = {
        enable = true,
    },
    context_commentstring = {
        enable = true,
    },
    textobjects = {
        select = {
            enable = true,
            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@comment.outer",
                ["ic"] = "@comment.inner",
            },
        },
    },
    textsubjects = {
        enable = true,
        keymaps = {
            ["<CR>"] = "textsubjects-smart",
            [";"] = "textsubjects-container-outer",
        },
    },
}
