return {
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			lsp = {
				progress = {
					enabled = false,
				},
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
				hover = {
					enabled = false,
				},
				signature = {
					enabled = false,
				},
			},
			messages = {
				enabled = true,
				view = "notify",
				view_error = "notify",
				view_warn = "notify",
				view_search = "virtualtext",
			},
			routes = {
				{
					filter = { event = "msg_show", kind = "", find = "written" },
					opts = { skip = true },
				},
				{
					filter = { event = "msg_show", find = "search hit BOTTOM" },
					opts = { skip = true },
				},
				{
					filter = { event = "msg_show", find = "search hit TOP" },
					opts = { skip = true },
				},
				{
					filter = { min_height = 5 },
					view = "split",
				},
			},
			presets = {
				bottom_search = false,
				command_palette = true,
				long_message_to_split = true,
				inc_rename = false,
				lsp_doc_border = true,
			},
			views = {
				notify = {
					render = "compact",
					replace = true,
					animation = false,
				},
			},
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
			{
				"rcarriga/nvim-notify",
				opts = {
					background_colour = "#000000",
					render = "compact",
					timeout = 3000,
					max_width = 50,
					max_height = 15,
					top_down = false,
					anchor = "SE",
				},
			},
		},
	},
}
