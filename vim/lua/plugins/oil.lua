return {
	{ "nvim-tree/nvim-tree.lua", enabled = false },
	{
		"stevearc/oil.nvim",
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {},
		dependencies = { "nvim-tree/nvim-web-devicons" },
		lazy = false,
	},
}
