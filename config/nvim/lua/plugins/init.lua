return {
	-- Modules
	{ import = "nvchad.blink.lazyspec" }, -- Better completions

	-- Formatter configuration
	{
		"stevearc/conform.nvim",
		event = "BufWritePre", -- uncomment for format on save
		opts = require("config.conform"),
	},

	-- Language server configuration
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("config.lspconfig")
		end,
	},

	-- Disable LSP installer in place for Nix manual LSP config
	{
		"williamboman/mason.nvim",
		enabled = false,
	},

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
			auto_install = true,
			sync_install = false,
		},
	},

	-- Undo history
	{
		"mbbill/undotree",
		event = "VeryLazy",
	},

	-- Inline diagnostics
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "VeryLazy",
		priority = 1000,
		config = function()
			require("tiny-inline-diagnostic").setup()
			vim.diagnostic.config({ virtual_text = false }) -- Disable Neovim's default virtual text diagnostics
		end,
	},

	-- Fuzzy finder
	{
		"nvim-telescope/telescope.nvim",
		version = "*",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
	},

	-- File explorer
	{ "nvim-tree/nvim-tree.lua", enabled = false },
	{
		"stevearc/oil.nvim",
		opts = {},
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
		lazy = false,
	},

	-- Markdown file highlighter
	{
		"MeanderingProgrammer/render-markdown.nvim",
		ft = { "markdown" },
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("render-markdown").setup()
		end,
	},
}
