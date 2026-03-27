return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = false,
	config = function()
		local base16 = require("base46").get_theme_tb("base_16")
		local base30 = require("base46").get_theme_tb("base_30")

		local theme = {
			normal = {
				a = { fg = base16.base07, bg = base30.one_bg3, gui = "bold" },
				b = { fg = base16.base07, bg = base30.lightbg },
				c = { fg = base16.base07 },
			},
			command = { a = { fg = base16.base0D, bg = base30.one_bg3, gui = "bold" } },
			insert = { a = { fg = base16.base0B, bg = base30.one_bg3, gui = "bold" } },
			replace = { a = { fg = base16.base00, bg = base16.base0A, gui = "bold" } },
			terminal = { a = { fg = base16.base0E, bg = base30.one_bg3, gui = "bold" } },
			visual = { a = { fg = base16.base08, bg = base30.one_bg3, gui = "bold" } },
			inactive = { a = { fg = base16.base05, bg = base30.lightbg } },
		}

		local lsp_name = {
			function()
				local clients = vim.lsp.get_clients({ bufnr = 0 })
				if #clients == 0 then
					return "none-ls"
				end
				local names = {}
				for _, c in ipairs(clients) do
					table.insert(names, c.name)
				end
				return table.concat(names, ", ")
			end,
		}

		require("lualine").setup({
			options = {
				theme = theme,
				component_separators = { left = "|", right = "|" },
				section_separators = { left = "", right = "" },
				globalstatus = true,
			},
			sections = {
				lualine_a = {
					{
						"mode",
						separator = { left = "", right = "" },
						right_padding = 2,
						fmt = function(s)
							return s:sub(1, 3)
						end,
					},
				},
				lualine_b = { "filename", { "branch", icon = "", padding = { left = 0, right = 1 } } },
				lualine_c = { "diff", "diagnostics" },
				lualine_x = { lsp_name },
				lualine_y = { "progress" },
				lualine_z = {
					{ "location", separator = { left = "", right = "" }, left_padding = 2 },
				},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}
