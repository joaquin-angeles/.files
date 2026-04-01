local base30 = require("base46").get_theme_tb("base_30")
vim.api.nvim_set_hl(0, "FzfLuaBorder", { fg = base30.grey })

return {
	-- Disable default fuzzy finder for fzf-lua
	{ "nvim-telescope/telescope.nvim", enabled = false },

	{

		"ibhagwan/fzf-lua",
		event = "VeryLazy",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		---@module "fzf-lua"
		---@diagnostic disable: missing-fields
		opts = {
			winopts = {
				title_pos = "center",
				height = 1.0,
				width = 1.0,
				row = 0,
				col = 0,
				border = "none",
				preview = { horizontal = "right:55%", border = "rounded" },
			},
			fzf_opts = {
				["--layout"] = "default",
			},
		},
		---@diagnostic enable: missing-fields
	},
}
