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

	-- Disable default fuzzy finder for fzf-lua
	{ "nvim-telescope/telescope.nvim", enabled = false },

	-- Treesitter parsers
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"nix",
				"lua",
				"bash",
				"hyprlang",
				"toml",
				"css",
				"json",
			},
			highlight = { enable = true },
			indent = { enable = true },
		},
	},

	-- Undo history
	{ "mbbill/undotree", event = "VeryLazy" },
}
