require("chmod")
require("full-border"):setup({})
require("smart-enter")
require("session"):setup {
    sync_yanked = true,
}
require("yatline"):setup({
    section_separator = { open = "", close = "" },
    part_separator = { open = "", close = "" },
    inverse_separator = { open = "", close = "" },

    style_a = {
        fg = "cyan",
        bg_mode = {
            normal = nil,
            select = nil,
            un_set = nil
        },
    },
    style_b = {
        fg = "white",
        bg_mode = {
            normal = nil,
            select = nil,
            un_set = nil
        }
    },
    style_c = {
        fg = "blue",
        bg_mode = {
            normal = nil,
            select = nil,
            un_set = nil
        }
    },

    permissions_t_fg = "green",
    permissions_r_fg = "yellow",
    permissions_w_fg = "red",
    permissions_x_fg = "cyan",
    permissions_s_fg = "grey",

    tab_width = 20,
    tab_use_inverse = false,

    selected = { icon = "󰻭", fg = "yellow" },
    copied = { icon = "", fg = "green" },
    cut = { icon = "", fg = "red" },

    total = { icon = "󰮍", fg = "yellow" },
    succ = { icon = "", fg = "green" },
    fail = { icon = "", fg = "red" },
    found = { icon = "󰮕", fg = "blue" },
    processed = { icon = "󰐍", fg = "green" },

    show_background = false,

    display_header_line = true,
    display_status_line = true,

    header_line = {
        left = {
            section_a = {
                {type = "string", custom = false, name = "hovered_path"},
            },
            section_b = { },
            section_c = {
            }
        },
        right = {
            section_a = {
                {type = "coloreds", custom = false, name = "count"},
            },
            section_b = {
            },
            section_c = {
            }
        }
    },

    status_line = {
        left = {
            section_a = {
                { type = "string", name = "tab_mode", },
                {type = "coloreds", custom = false, name = "permissions"},
            },
            section_b = {
                {type = "string", custom = false, name = "hovered_ownership"},
            },
            section_c = {
                {type = "string", custom = false, name = "hovered_size"},
            }
        },
        right = {
            section_a = {},
            section_b = {
                {type = "string", custom = false, name = "cursor_position"},
            },
            section_c = {}
        }
    },
})

-- Symlink in status bar
-- function Status:name()
--     local h = cx.active.current.hovered
--     if not h then
--         return ui.Span("")
--     end
--     local linked = ""
--     if h.link_to ~= nil then
--         linked = " -> " .. tostring(h.link_to)
--     end
--     return ui.Span(" " .. h.name .. linked)
-- end
