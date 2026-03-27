require("nvchad.options")

local o = vim.o
o.cursorlineopt = "both" -- Enable cursorline

-- Line numbers
o.number = true
o.relativenumber = true
o.swapfile = false -- Disable swap file

-- Transparent background
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none" })
-- o.termguicolors = true

-- Indent config
o.autoindent = true
o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4
o.expandtab = true
