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

-- Treesitter fixes
vim.api.nvim_create_autocmd("FileType", {
    callback = function()
        local ft = vim.bo.filetype
        if ft == "" then return end
        local lang = vim.treesitter.language.get_lang(ft) or ft
        local ok, _ = pcall(vim.treesitter.get_parser, 0, lang)
        if ok then
            vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            -- Ensure highlighting is also active
            pcall(vim.treesitter.start)
        end
    end,
})
