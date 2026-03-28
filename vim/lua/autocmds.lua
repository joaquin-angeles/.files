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

vim.api.nvim_create_autocmd("ColorScheme", {
	callback = function()
		require("base46").load_all_highlights()
		vim.schedule(function()
			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		end)
	end,
})
