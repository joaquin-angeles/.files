return {
	{
		"ibhagwan/fzf-lua",
		lazy = false,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		---@module "fzf-lua"
		---@diagnostic disable: missing-fields
		opts = {
			winopts = {
				title_pos = "center",
				height = 0.80,
				width = 0.85,
				row = 0.50,
				col = 0.50,
				border = "rounded",
				preview = {
					horizontal = "right:55%",
					border = "rounded",
				},
			},
		},
		---@diagnostic enable: missing-fields
	},
}
