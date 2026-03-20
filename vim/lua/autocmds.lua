require("nvchad.autocmds")

-- Absolute line numbers on Insert mode
vim.api.nvim_create_autocmd("InsertEnter", {
	callback = function()
		vim.o.relativenumber = false
	end,
})

-- Relative lines on Normal mode
vim.api.nvim_create_autocmd("InsertLeave", {
	callback = function()
		vim.o.relativenumber = true
	end,
})

-- Treesitter fixes
vim.api.nvim_create_autocmd("FileType", {
	callback = function()
		local ft = vim.bo.filetype
		if ft == "" then
			return
		end
		local lang = vim.treesitter.language.get_lang(ft) or ft
		local ok, _ = pcall(vim.treesitter.get_parser, 0, lang)
		if ok then
			vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			-- Ensure highlighting is also active
			pcall(vim.treesitter.start)
		end
	end,
})
