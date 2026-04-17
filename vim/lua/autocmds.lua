require("nvchad.autocmds")

-- Absolute line numbers on Insert mode
local number_group = vim.api.nvim_create_augroup("NumberToggle", { clear = true })

vim.api.nvim_create_autocmd("InsertEnter", {
	group = number_group,
	callback = function()
		vim.o.relativenumber = false
	end,
})

-- Relative lines on Normal mode
vim.api.nvim_create_autocmd("InsertLeave", {
	group = number_group,
	callback = function()
		vim.o.relativenumber = true
	end,
})

-- Treesitter fixes
local ts_group = vim.api.nvim_create_augroup("TreesitterAttach", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
	group = ts_group,
	callback = function()
		local ft = vim.bo.filetype
		if ft == "" then
			return
		end
		local lang = vim.treesitter.language.get_lang(ft) or ft
		local ok, _ = pcall(vim.treesitter.get_parser, 0, lang)
		if ok then
			vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			pcall(vim.treesitter.start)
		end
	end,
})

-- vim.schedule(function()
-- 	local function set_transparent(groups)
-- 		for _, group in ipairs(groups) do
-- 			vim.api.nvim_set_hl(0, group, {})
-- 		end
-- 	end
--
-- 	set_transparent({
-- 		"Normal",
-- 		"NormalNC",
-- 		"StatusLine",
-- 		"StatusLineNC",
-- 	})
-- end)
