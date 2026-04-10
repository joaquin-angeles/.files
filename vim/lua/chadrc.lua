-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "gruvchad",
	transparency = true,

	hl_override = {
		Comment = { italic = true },
		["@comment"] = { italic = true },
		TbFill = { bg = "black2" },
		TbBufOff = { bg = "black2" },
		TbBufOffClose = { fg = "black2", bg = "black2" },
		TbBufOffModified = { fg = "black2", bg = "black2" },
		TbBufOnClose = { bg = "none" },
		TbBufOnModified = { bg = "none" },
		Tabline = { bg = "none" },
		NormalFloat = { bg = "black" },
		FloatBorder = { bg = "black" },
		CmpDoc = { bg = "black" },
		CmpPmenu = { bg = "black" },
		Pmenu = { bg = "black" },
	},
}

-- M.nvdash = { load_on_startup = true }
M.ui = {
	statusline = {
		theme = "minimal",
		separator_style = "round",
	},
}

return M
