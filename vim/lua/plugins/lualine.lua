return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = { "BufReadPre", "BufReadPost", "BufNewFile", "BufAdd" },
	config = function()
		local base30 = require("base46").get_theme_tb("base_30")

		local z = { fg = base30.white, bg = base30.one_bg3 }
		local theme = {
			normal = {
				a = { fg = base30.white, bg = base30.one_bg3, gui = "bold" },
				b = { fg = base30.white, bg = base30.lightbg },
				c = { fg = base30.white },
				z = z,
			},
			inactive = {
				a = { fg = base30.light_grey, bg = base30.lightbg },
				z = z,
			},
		}

		for mode, fg in pairs({
			command = base30.yellow,
			insert = base30.green,
			replace = base30.red,
			terminal = base30.cyan,
			visual = base30.orange,
		}) do
			theme[mode] = { a = { fg = fg, bg = base30.one_bg3, gui = "bold" }, z = z }
		end

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
				return "󰒋 " .. table.concat(names, ", ")
			end,
			color = { fg = base30.teal },
		}

		require("nvim-web-devicons").setup({ default = true })
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = theme,
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				globalstatus = true,
			},
			sections = {
				-- Left modules
				lualine_a = {
					{
						"mode",
						separator = { left = "", right = "" },
						right_padding = 2,
						fmt = function(s)
							return s:sub(1, 3)
						end,
					},
				},
				lualine_b = {
					{
						function()
							local filename = vim.fn.expand("%:t")
							local ext = vim.fn.expand("%:e")
							local icon = require("nvim-web-devicons").get_icon(filename, ext, { default = true })
							return icon .. " " .. filename
						end,
					},
				},
				lualine_c = {
					{ "branch", icon = "󰘬", color = { fg = base30.purple } },
					{
						"diff",
						diff_color = {
							added = { fg = base30.green },
							modified = { fg = base30.yellow },
							removed = { fg = base30.red },
						},
					},
				},

				-- Right modules
				lualine_x = {
					{
						"diagnostics",
						diagnostics_color = {
							error = { fg = base30.red },
							warn = { fg = base30.yellow },
							info = { fg = base30.blue },
							hint = { fg = base30.cyan },
						},
					},
					lsp_name,
				},
				lualine_y = {
					{
						function()
							return "󰉋 " .. vim.fn.expand("%:p:h:t")
						end,
					},
				},
				lualine_z = {
					{ "location", separator = { left = "", right = "" } },
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
