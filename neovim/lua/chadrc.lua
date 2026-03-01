---@type ChadrcConfig
local M = {}

M.base46 = {
    theme = "gruvchad",
    hl_override = {
        Comment = { italic = true },
        ["@comment"] = { italic = true },
    },
}

-- Bufferline
M.ui = {
    cmp = {
        style = "blink",
    },
}

return M
