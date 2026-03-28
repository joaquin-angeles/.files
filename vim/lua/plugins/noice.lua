return {
	{
		"folke/noice.nvim",
		lazy = false,
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		config = function()
			require("noice").setup({
				routes = {
					{
						filter = {
							event = "notify",
							find = "No information available",
						},
						opts = { skip = true },
					},
					{
						filter = {
							event = "notify",
							find = "No signature help available",
						},
						opts = { skip = true },
					},
					{
						filter = {
							find = "NotifyBackground",
						},
						opts = { skip = true },
					},
				},
				lsp = {
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true,
					},
				},
				presets = {
					bottom_search = true,
					command_palette = true,
					long_message_to_split = true,
					inc_rename = false,
					lsp_doc_border = false,
				},
			})
			require("base46").load_all_highlights()
			vim.schedule(function()
				vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
				vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
			end)
		end,
	},
}
