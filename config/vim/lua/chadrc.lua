local M = {}

M.base46 = {
	theme = "gruvchad",
	hl_override = {
		-- Italic comments
		Comment = { italic = true },
		["@comment"] = { italic = true },

		-- Transparent active buffer
		TbBufOn = { bg = "none" },
		TbBufOnClose = { bg = "none" },
		TbBufOnModified = { bg = "none" },
		Tabline = { bg = "none" },
	},
}

M.ui = {
	statusline = {
		theme = "minimal",
		separator_style = "round",
	},
}

return M
