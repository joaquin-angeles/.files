local yatline = require("yatline")

local M = {}

M.base = (os.getenv("YAZI_CONFIG_HOME") or (os.getenv("HOME") .. "/.config/yazi")) .. "/lua/"

function M.load(path)
	return dofile(M.base .. path)
end

M.load("yatline/coloreds.lua")
M.load("yatline/lines.lua")

local empty = { section_a = {}, section_b = {}, section_c = {} }
yatline:setup({
	section_separator = { open = "", close = "" },
	part_separator = { open = "", close = "" },
	inverse_separator = { open = "", close = "" },
	style_a = { fg = "blue", bg_mode = { normal = nil, select = nil, un_set = nil } },
	style_b = { fg = "yellow", bg_mode = { normal = nil, select = nil, un_set = nil } },
	style_c = { fg = "grey", bg_mode = { normal = nil, select = nil, un_set = nil } },
	permissions_t_fg = "green",
	permissions_r_fg = "yellow",
	permissions_w_fg = "red",
	permissions_x_fg = "cyan",
	permissions_s_fg = "grey",
	tab_width = 20,
	tab_use_inverse = false,
	show_background = false,
	display_header_line = true,
	display_status_line = true,
	selected = { icon = "󰻭", fg = "yellow" },
	copied = { icon = "", fg = "green" },
	cut = { icon = "", fg = "red" },
	total = { icon = "󰮍", fg = "yellow" },
	succ = { icon = "", fg = "green" },
	fail = { icon = "", fg = "red" },
	found = { icon = "󰮕", fg = "blue" },
	processed = { icon = "󰐍", fg = "green" },
	header_line = {
		left = { section_a = { { type = "coloreds", name = "hovered_path" } }, section_b = {}, section_c = {} },
		right = empty,
	},
	status_line = {
		left = {
			section_a = { { type = "coloreds", name = "permissions" } },
			section_b = { { type = "string", name = "hovered_ownership" } },
			section_c = {
				{ type = "coloreds", name = "hovered_size" },
				{ type = "coloreds", name = "hovered_mtime" },
				{ type = "line", name = "hovered_symlink" },
			},
		},
		right = {
			section_a = {},
			section_b = {},
			section_c = { { type = "string", name = "cursor_position" }, { type = "coloreds", name = "count" } },
		},
	},
})
