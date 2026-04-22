require("nvchad.autocmds")

-- Variables
local number_group = vim.api.nvim_create_augroup("NumberToggle", { clear = true })
local ts = vim.treesitter
local aug = vim.api.nvim_create_augroup("treesitter_attach", { clear = true })

-- Absolute line numbers on Insert mode
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
vim.api.nvim_create_autocmd("FileType", {
	group = aug,
	callback = function(args)
		local ft = vim.bo[args.buf].filetype
		if ft == "" then
			return
		end
		local lang = ts.language.get_lang(ft) or ft
		if not pcall(ts.get_parser, args.buf, lang) then
			return
		end
		vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
		pcall(ts.start, args.buf, lang)
	end,
})

vim.schedule(function()
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
end)
