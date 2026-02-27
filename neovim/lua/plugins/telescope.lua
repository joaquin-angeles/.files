return {
    -- Treesitter installation
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "vim", "lua", "vimdoc",
                "html", "css", "nix",
                "bash", "hyprlang", "json",
                "jsonc", "toml", "yaml",
            },
        },
        -- Fzf integration
        dependencies = {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
            lazy = false,
        },
    },
}
