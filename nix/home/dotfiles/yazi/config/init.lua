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

Yatline.coloreds.get.user_host_dir = function(self)
	local username = ya.user_name() or "unknown"
	local hostname = ya.host_name() or "unknown"
	local cwd = tostring(cx.active.current.cwd)
	local home = os.getenv("HOME") or ""

	-- Replace home prefix with ~
	if cwd:sub(1, #home) == home then
		cwd = "~" .. cwd:sub(#home + 1)
	end

	local parent, child
	if cwd == "~" then
		parent = "~"
		child = ""
	else
		parent = cwd:match("^(.*)/[^/]+$") or cwd
		child = cwd:match("[^/]+$") or ""
		if parent ~= "/" then
			parent = parent .. "/"
		end
	end

	-- Get hovered entry name safely
	local hovered_name = ""
	local hovered = cx.active.current.hovered
	if hovered then
		local ok, name = pcall(function()
			return tostring(hovered.name)
		end)
		if ok and name then
			hovered_name = name
		end
	end

	return {
		{ username .. "@" .. hostname, "green" },
		{ ":", "white" },
		{ parent, "blue" },
		{ child, "blue" },
		{ hovered_name ~= "" and "/" or "", "blue" },
		{ hovered_name, "white" },
	}
end

Yatline.coloreds.get.selection_status = function(self)
	local selected = #cx.active.selected
	local yanked = #cx.yanked
	if selected == 0 and yanked == 0 then
		return {}
	end

	local result = {}

	if selected > 0 then
		result[#result + 1] = { "󰒆 " .. selected .. "  ", "yellow" }
	end

	if yanked > 0 then
		if cx.yanked.is_cut then
			result[#result + 1] = { "󰆐 " .. yanked .. "  ", "red" }
		else
			result[#result + 1] = { "󰆏 " .. yanked .. "  ", "green" }
		end
	end

	return result
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
		fg = "cyan",
		bg_mode = {
			normal = nil,
			select = nil,
			un_set = nil,
		},
	},
	style_b = {
		fg = "blue",
		bg_mode = {
			normal = nil,
			select = nil,
			un_set = nil,
		},
	},
	style_c = {
		fg = "grey",
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
				{ type = "coloreds", custom = false, name = "user_host_dir" },
			},
			section_b = {},
			section_c = {},
		},
		right = {
			section_a = {},
			section_b = {},
			section_c = {},
		},
	},

	status_line = {
		left = {
			section_a = {
				{ type = "coloreds", custom = false, name = "permissions" },
			},
			section_b = {},
			section_c = {
				{ type = "string", custom = false, name = "hovered_ownership" },
				{ type = "string", custom = false, name = "hovered_size" },
				{ type = "string", custom = false, name = "hovered_mtime" },
				{ type = "string", custom = false, name = "hovered_symlink" },
			},
		},
		right = {
			section_a = {},
			section_b = {},
			section_c = {
				{ type = "string", custom = false, name = "cursor_position" },
				{ type = "coloreds", custom = false, name = "selection_status" },
			},
		},
	},
})
