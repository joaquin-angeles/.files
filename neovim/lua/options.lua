require "nvchad.options"

-- add yours here!

local o = vim.o
o.cursorlineopt ='both' -- to enable cursorline!

-- Line numbers
o.number = true
o.relativenumber = true

o.swapfile = false -- Disable swap file
-- vim.o.guicursor = "i:block-blinkon500-blinkoff500" -- Cursor configuration

-- Transparent background
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })

-- Indent config
o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4
o.expandtab = true
vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
