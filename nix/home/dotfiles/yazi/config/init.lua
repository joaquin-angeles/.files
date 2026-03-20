require("chmod")
require("git"):setup()
require("smart-enter")
require("full-border"):setup({
	type = ui.Border.PLAIN,
})
require("session"):setup({
	sync_yanked = true,
})

local yatline = require("yatline")

Yatline.string.get.hovered_mtime = function(self)
	local hovered = cx.active.current.hovered
	if not hovered then
		return ""
	end

	local time = math.floor(hovered.cha.mtime or 0)
	if time == 0 then
		return ""
	end

	if os.date("%Y", time) == os.date("%Y") then
		return os.date("%d %b %H:%M", time)
	else
		return os.date("%d %b %Y", time)
	end
end

Yatline.coloreds.get.user_host = function(self)
	local username = ya.user_name() or "unknown"
	local hostname = ya.host_name() or "unknown"
	return { { username .. "@" .. hostname .. ":", "green" } }
end

Yatline.string.get.hovered_symlink = function(self)
	local hovered = cx.active.current.hovered
	if not hovered then
		return ""
	end
	if not hovered.link_to then
		return ""
	end

	return "-> " .. tostring(hovered.link_to)
end

yatline:setup({
	section_separator = { open = "", close = "" },
	part_separator = { open = "", close = "" },
	inverse_separator = { open = "", close = "" },

	style_a = {
		fg = "blue",
		bg_mode = {
			normal = nil,
			select = nil,
			un_set = nil,
		},
	},
	style_b = {
		fg = "grey",
		bg_mode = {
			normal = nil,
			select = nil,
			un_set = nil,
		},
	},
	style_c = {
		fg = "cyan",
		bg_mode = {
			normal = nil,
			select = nil,
			un_set = nil,
		},
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
				{ type = "coloreds", custom = false, name = "user_host" },
				{ type = "string", custom = false, name = "hovered_path" },
			},
			section_b = {},
			section_c = {},
		},
		right = {
			section_a = {
				{ type = "coloreds", custom = false, name = "count" },
			},
			section_b = {},
			section_c = {},
		},
	},

	status_line = {
		left = {
			section_a = {
				{ type = "coloreds", custom = false, name = "permissions" },
				{ type = "string", custom = false, name = "hovered_ownership" },
			},
			section_b = {
				{ type = "string", custom = false, name = "hovered_size" },
				{ type = "string", custom = false, name = "hovered_mtime" },
				{ type = "string", custom = false, name = "hovered_symlink" },
			},
			section_c = {},
		},
		right = {
			section_a = {},
			section_b = {
				{ type = "string", custom = false, name = "cursor_position" },
			},
			section_c = {},
		},
	},
})
