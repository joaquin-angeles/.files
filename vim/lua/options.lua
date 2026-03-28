require("nvchad.options")

local o = vim.o
o.cursorlineopt = "both" -- Enable cursorline

-- Line numbers
o.number = true
o.relativenumber = true
o.swapfile = false -- Disable swap file

-- Transparent background
o.termguicolors = true

-- Indent config
o.autoindent = true
o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4
o.expandtab = true
