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
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
o.termguicolors = true

-- Indent config
o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4
o.expandtab = true

vim.api.nvim_create_autocmd("FileType", {
    callback = function()
        local lang = vim.treesitter.language.get_lang(vim.bo.filetype) or vim.bo.filetype
        local has_parser = pcall(vim.treesitter.get_parser, 0, lang)
        if has_parser then
            vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
    end,
})
