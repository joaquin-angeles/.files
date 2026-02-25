-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
    theme = "gruvchad",
    hl_override = {
        Comment = { italic = true },
        ["@comment"] = { italic = true },
    },
}

-- Dashboard
-- M.nvdash = {
--     load_on_startup = false,
--     header = {
--         "                                                                       ",
--         "                                                                     ",
--         "       ████ ██████           █████      ██                     ",
--         "      ███████████             █████                             ",
--         "      █████████ ███████████████████ ███   ███████████   ",
--         "     █████████  ███    █████████████ █████ ██████████████   ",
--         "    █████████ ██████████ █████████ █████ █████ ████ █████   ",
--         "  ███████████ ███    ███ █████████ █████ █████ ████ █████  ",
--         " ██████  █████████████████████ ████ █████ █████ ████ ██████ ",
--         "                                                                       ",
--     },
-- 
--     -- Modules
--     buttons = {
--         { txt = "󰈔 New File", keys = "fn", cmd = "enew" }, -- Make new file
--         { txt = " Find File", keys = "ff", cmd = "Telescope find_files" }, -- Fuzzy file search
--         { txt = " Recent Files", keys = "fo", cmd = "Telescope oldfiles" }, -- Recent file search (fuzzy)
--         { txt = "󰈭 Find Word", keys = "fw", cmd = "Telescope live_grep" }, -- Word search (fuzzy)
--         { txt = " Mappings", keys = "ch", cmd = "NvCheatsheet" }, -- Keybind cheatsheet
--         { txt = "󱥚 Themes", keys = "th", cmd = ":lua require('nvchad.themes').open()" }, -- Theme picker
--         { txt = "󰍃 Quit", keys = "q", cmd = "qa!" },
-- 
--         { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },
-- 
--         {
--             txt = function()
--                 local stats = require("lazy").stats()
--                 local ms = math.floor(stats.startuptime) .. " ms"
--                 return " Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms
--             end,
--             hl = "NvDashFooter",
--             no_gap = true,
--             content = "fit",
--         },
-- 
--         { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },
--     },
-- }

-- Bufferline
M.ui = {
    cmp = {
        style = "blink",
    },
    -- tabufline = {
        --     lazyload = false
        -- }
}

    return M
