require("chmod")
require("git"):setup()
require("smart-enter")
require("full-border"):setup({ type = ui.Border.PLAIN })
require("session"):setup({ sync_yanked = true })

local yatline = require("yatline")

-- Allow table-based styles in coloreds
local orig_colored = Yatline.coloreds.render
Yatline.coloreds.render = function(self, c)
	if type(c[2]) ~= "table" then
		return orig_colored(self, c)
	end
	local span = ui.Span(c[1])
	for _, a in ipairs({ "fg", "bg", "bold", "italic", "dim" }) do
		if c[2][a] then
			span = type(c[2][a]) == "boolean" and span[a](span) or span[a](span, c[2][a])
		end
	end
	return span
end

Yatline.coloreds.get.hovered_mtime = function()
	local h = cx.active.current.hovered
	local t = h and math.floor(h.cha.mtime or 0) or 0
	if t == 0 then
		return {}
	end
	return { { os.date(os.date("%Y", t) == os.date("%Y") and "%d %b %H:%M" or "%d %b %Y", t), "blue" } }
end

Yatline.coloreds.get.hovered_size = function()
	local size = cx.active.current.hovered and cx.active.current.hovered:size()
	return size and { { " " .. ya.readable_size(size) .. "  ", "green" } } or { { " -  ", "brightblack" } }
end

Yatline.coloreds.get.hovered_path = function()
	local cwd = tostring(cx.active.current.cwd):gsub("^" .. (os.getenv("HOME") or ""):gsub("/$", ""), "~")
	local is_root = cwd:match("^[/~]$")
	local child = is_root and "" or (cwd:match("[^/]+$") or "")
	local parent = is_root and cwd or cwd:sub(1, #cwd - #child - 1):gsub("^$", "/")
	local hovered = (cx.active.current.hovered or {}).name or ""
	local child_str = child ~= "" and (parent ~= "/" and "/" or "") .. child .. "/" or ""
	return {
		{ (ya.user_name() or "unknown") .. "@" .. (ya.host_name() or "unknown"), "green" },
		{ ":", "white" },
		{ parent .. (parent == "~" and child == "" and hovered ~= "" and "/" or ""), "blue" },
		{ child_str, "blue" },
		{ hovered, "grey" },
	}
end

Yatline.coloreds.get.count = function(self)
	local selected, yanked = #cx.active.selected, #cx.yanked
	if selected == 0 and yanked == 0 then
		return {}
	end
	local result = {}
	if selected > 0 then
		result[#result + 1] = { "󰒆 " .. selected .. " ", "yellow" }
	end
	if yanked > 0 then
		result[#result + 1] = cx.yanked.is_cut and { "󰆐 " .. yanked .. " ", "red" }
			or { "󰆏 " .. yanked .. " ", "green" }
	end
	return result
end

Yatline.line.get.hovered_symlink = function(self)
	local hovered = cx.active.current.hovered
	if not hovered or not hovered.link_to then
		return nil
	end
	local path, cha = tostring(hovered.link_to), hovered.cha
	if cha.is_orphan then
		return ui.Line({ ui.Span("  -> "):fg("red"), ui.Span(path):fg("red") })
	end
	local name = path:match("[^/]+$") or ""
	local name_span = cha.is_dir and ui.Span(name):fg("blue"):bold() or ui.Span(name):fg("grey")
	return ui.Line({ ui.Span("  -> "):fg("brightblack"), ui.Span(path:sub(1, #path - #name)):fg("cyan"), name_span })
end

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

	selected = { icon = "󰻭", fg = "yellow" },
	copied = { icon = "", fg = "green" },
	cut = { icon = "", fg = "red" },
	total = { icon = "󰮍", fg = "yellow" },
	succ = { icon = "", fg = "green" },
	fail = { icon = "", fg = "red" },
	found = { icon = "󰮕", fg = "blue" },
	processed = { icon = "󰐍", fg = "green" },

	show_background = false,
	display_header_line = true,
	display_status_line = true,

	header_line = {
		left = {
			section_a = { { type = "coloreds", custom = false, name = "hovered_path" } },
			section_b = {},
			section_c = {},
		},
		right = { section_a = {}, section_b = {}, section_c = {} },
	},
	status_line = {
		left = {
			section_a = { { type = "coloreds", custom = false, name = "permissions" } },
			section_b = { { type = "string", custom = false, name = "hovered_ownership" } },
			section_c = {
				{ type = "coloreds", custom = false, name = "hovered_size" },
				{ type = "coloreds", custom = false, name = "hovered_mtime" },
				{ type = "line", custom = false, name = "hovered_symlink" },
			},
		},
		right = {
			section_a = {},
			section_b = {},
			section_c = {
				{ type = "string", custom = false, name = "cursor_position" },
				{ type = "coloreds", custom = false, name = "count" },
			},
		},
	},
})
