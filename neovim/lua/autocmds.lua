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
