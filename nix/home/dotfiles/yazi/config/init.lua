require("chmod")
require("git"):setup()
require("smart-enter")
require("full-border"):setup({ type = ui.Border.PLAIN })
require("session"):setup({ sync_yanked = true })

local yatline = require("yatline")

-- Extended style support for coloreds
local orig_colored = Yatline.coloreds.render
Yatline.coloreds.render = function(self, component)
	local text, style = component[1], component[2]
	if type(style) ~= "table" then
		return orig_colored(self, component)
	end
	local span = ui.Span(text)
	for _, attr in ipairs({ "fg", "bg", "bold", "italic", "dim" }) do
		if style[attr] then
			span = type(style[attr]) == "boolean" and span[attr](span) or span[attr](span, style[attr])
		end
	end
	return span
end

Yatline.coloreds.get.hovered_mtime = function(self)
	local hovered = cx.active.current.hovered
	local time = hovered and math.floor(hovered.cha.mtime or 0) or 0
	if time == 0 then
		return {}
	end
	local fmt = os.date("%Y", time) == os.date("%Y") and "%d %b %H:%M" or "%d %b %Y"
	return { { os.date(fmt, time), "blue" } }
end

Yatline.coloreds.get.hovered_size = function(self)
	local size = cx.active.current.hovered and cx.active.current.hovered:size()
	return size and { { " " .. ya.readable_size(size) .. "  ", "green" } } or { { " -  ", "brightblack" } }
end

Yatline.coloreds.get.hovered_path = function(self)
	local cwd = tostring(cx.active.current.cwd)
	local home = (os.getenv("HOME") or ""):gsub("/$", "")
	if home ~= "" then
		cwd = cwd:gsub("^" .. home, "~")
	end

	local child = cwd:match("^[/~]$") and "" or cwd:match("[^/]+$") or ""
	local parent = cwd:match("^[/~]$") and cwd or cwd:sub(1, #cwd - #child - 1):gsub("^$", "/")

	local hovered = (cx.active.current.hovered or {}).name or ""
	local child_str = child ~= "" and (parent ~= "/" and "/" or "") .. child .. "/" or ""
	local parent_str = parent .. (parent == "~" and child == "" and hovered ~= "" and "/" or "")

	return {
		{ (ya.user_name() or "unknown") .. "@" .. (ya.host_name() or "unknown"), "green" },
		{ ": ", "white" },
		{ parent_str, "blue" },
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
	local trail = path:sub(1, #path - #name)

	local EXT = {
		png = "magenta",
		jpg = "magenta",
		jpeg = "magenta",
		gif = "magenta",
		webp = "magenta",
		bmp = "magenta",
		tiff = "magenta",
		svg = "magenta",
		mp4 = "magenta",
		mkv = "magenta",
		ogv = "magenta",
		avi = "magenta",
		mov = "magenta",
		wmv = "magenta",
		m2ts = "magenta",
		webm = "magenta",
		mp3 = "blue",
		ogg = "blue",
		m4a = "blue",
		aac = "blue",
		flac = "brightblue",
		wav = "brightblue",
		alac = "brightblue",
		aiff = "brightblue",
		pdf = "cyan",
		doc = "cyan",
		docx = "cyan",
		dvi = "cyan",
		odt = "cyan",
		rtf = "cyan",
		zip = "red",
		tar = "red",
		gz = "red",
		tgz = "red",
		zst = "red",
		xz = "red",
		bz2 = "red",
		rar = "red",
		["7z"] = "red",
		lz4 = "red",
		asc = "brightgreen",
		enc = "brightgreen",
		p12 = "brightgreen",
		pem = "brightgreen",
		gpg = "brightgreen",
		lua = "brightyellow",
		js = "brightyellow",
		ts = "brightyellow",
		py = "brightyellow",
		c = "brightyellow",
		cpp = "brightyellow",
		rs = "brightyellow",
		go = "brightyellow",
		rb = "brightyellow",
		java = "brightyellow",
		cs = "brightyellow",
		hs = "brightyellow",
		sh = "brightyellow",
		fish = "brightyellow",
		zsh = "brightyellow",
		toml = "yellow",
		json = "yellow",
		yaml = "yellow",
		yml = "yellow",
		xml = "yellow",
		cmake = "yellow",
		o = "yellow",
		pyc = "yellow",
		class = "yellow",
		tmp = "darkgray",
		swp = "darkgray",
		bak = "darkgray",
	}

	local name_span
	if cha.is_dir then
		name_span = ui.Span(name):fg("blue"):bold()
	else
		local ext = name:match("%.([^%.]+)$")
		name_span = ui.Span(name):fg((ext and EXT[ext:lower()]) or "grey")
	end

	return ui.Line({ ui.Span("  -> "):fg("brightblack"), ui.Span(trail):fg("cyan"), name_span })
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
