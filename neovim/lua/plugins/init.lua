return {
    {
        "stevearc/conform.nvim",
        event = 'BufWritePre', -- uncomment for format on save
        opts = require "configs.conform",
    },

    -- These are some examples, uncomment them if you want to see them work!
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "configs.lspconfig"
        end,
    },

    { import = "nvchad.blink.lazyspec" }, -- test new blink
    { "mbbill/undotree", lazy = false, }, -- Undo history
    { "williamboam/mason.nvim", enabled = false, },
}
