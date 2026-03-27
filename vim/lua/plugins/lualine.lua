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
				c = { fg = base16.base07, bg = base30.statusline_bg },
			},
			command = { a = { fg = base16.base00, bg = base16.base0D, gui = "bold" } },
			inactive = { a = { fg = base16.base05, bg = base30.lightbg } },
			insert = { a = { fg = base16.base00, bg = base16.base0B, gui = "bold" } },
			replace = { a = { fg = base16.base00, bg = base16.base0A, gui = "bold" } },
			terminal = { a = { fg = base16.base00, bg = base16.base0E, gui = "bold" } },
			visual = { a = { fg = base16.base00, bg = base16.base08, gui = "bold" } },
		}

		local lsp_name = {
			function()
				local clients = vim.lsp.get_clients({ bufnr = 0 })
				if #clients == 0 then
					return ""
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
				section_separators = { left = "", right = "" },
				globalstatus = true,
			},
			sections = {
				lualine_a = {
					{
						"mode",
						fmt = function(s)
							return s:sub(1, 3)
						end,
					},
				},
				lualine_b = { { "branch", icon = "", padding = { left = 0, right = 1 } }, "diff", "diagnostics" },
				lualine_c = { "filename", "filetype" },
				lualine_x = { lsp_name },
				lualine_y = { "progress" },
				lualine_z = { "location" },
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
