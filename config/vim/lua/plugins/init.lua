return {
	{
		"stevearc/conform.nvim",
		event = "BufWritePre", -- uncomment for format on save
		opts = require("config.conform"),
	},

	-- These are some examples, uncomment them if you want to see them work!
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("config.lspconfig")
		end,
	},

	{ import = "nvchad.blink.lazyspec" }, -- test new blink

	-- Treesitter parsers
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"nix",
				"lua",
				"bash",
				"toml",
				"css",
				"json",
			},
			highlight = { enable = true },
			indent = { enable = true },
			auto_install = false,
			sync_install = false,
		},
	},

	-- Undo history
	{ "mbbill/undotree", event = "VeryLazy" },
}
