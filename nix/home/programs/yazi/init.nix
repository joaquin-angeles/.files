{ ... }:

{
  programs.yazi.initLua = ''
    require("chmod")
    require("git"):setup()
    require("smart-enter")
    require("full-border"):setup({ type = ui.Border.PLAIN })
    require("session"):setup({ sync_yanked = true })

    local yatline = require("yatline")

    local function hovered()
    	return cx.active.current.hovered
    end

    local function readable_size(s)
    	return s and ya.readable_size(s) or nil
    end

    local function fmt_size(s)
    	return s and { { " " .. readable_size(s) .. "  ", "green" } } or { { " -  ", "brightblack" } }
    end

    local function fmt_mtime(t)
    	if t == 0 then
    		return {}
    	end
    	local fmt = os.date("%Y", t) == os.date("%Y") and "%d %b %H:%M" or "%d %b %Y"
    	return { { os.date(fmt, t), "blue" } }
    end

    local function home_short(path)
    	local home = (os.getenv("HOME") or ""):gsub("/$", "")
    	return tostring(path):gsub("^" .. home, "~")
    end

    Yatline.coloreds.get.hovered_size = function()
    	local h = hovered()
    	return fmt_size(h and h:size())
    end

    Yatline.coloreds.get.hovered_mtime = function()
    	local h = hovered()
    	local t = h and math.floor(h.cha.mtime or 0) or 0
    	return fmt_mtime(t)
    end

    Yatline.coloreds.get.hovered_path = function()
    	local cwd = home_short(cx.active.current.cwd)
    	local is_root = cwd:match("^[/~]$")

    	local child = is_root and "" or (cwd:match("[^/]+$") or "")
    	local parent = is_root and cwd or cwd:sub(1, #cwd - #child - 1):gsub("^$", "/")

    	local h = hovered()
    	local name = h and h.name or ""

    	local child_str = child ~= "" and (parent ~= "/" and "/" or "") .. child .. "/" or ""

    	return {
    		{ (ya.user_name() or "unknown") .. "@" .. (ya.host_name() or "unknown"), "green" },
    		{ ":", "white" },
    		{ parent .. (parent == "~" and child == "" and name ~= "" and "/" or ""), "blue" },
    		{ child_str, "blue" },
    		{ name, "grey" },
    	}
    end

    Yatline.coloreds.get.count = function()
    	local sel, yank = #cx.active.selected, #cx.yanked
    	if sel == 0 and yank == 0 then
    		return {}
    	end

    	local r = {}
    	if sel > 0 then
    		r[#r + 1] = { "󰒆 " .. sel .. " ", "yellow" }
    	end
    	if yank > 0 then
    		r[#r + 1] = cx.yanked.is_cut and { "󰆐 " .. yank .. " ", "red" } or { "󰆏 " .. yank .. " ", "green" }
    	end
    	return r
    end

    Yatline.line.get.hovered_symlink = function()
    	local h = hovered()
    	if not h or not h.link_to then
    		return nil
    	end

    	local path, cha = tostring(h.link_to), h.cha

    	if cha.is_orphan then
    		return ui.Line({
    			ui.Span("  -> "):fg("red"),
    			ui.Span(path):fg("red"),
    		})
    	end

    	local name = path:match("[^/]+$") or ""
    	local base = path:sub(1, #path - #name)

    	local name_span = cha.is_dir and ui.Span(name):fg("blue"):bold() or ui.Span(name):fg("grey")

    	return ui.Line({
    		ui.Span("  -> "):fg("brightblack"),
    		ui.Span(base):fg("cyan"),
    		name_span,
    	})
    end

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
    		left = {
    			section_a = {
    				{ type = "coloreds", name = "hovered_path" },
    			},
    			section_b = {},
    			section_c = {},
    		},
    		right = empty,
    	},

    	status_line = {
    		left = {
    			section_a = {
    				{ type = "coloreds", name = "permissions" },
    			},
    			section_b = {
    				{ type = "string", name = "hovered_ownership" },
    			},
    			section_c = {
    				{ type = "coloreds", name = "hovered_size" },
    				{ type = "coloreds", name = "hovered_mtime" },
    				{ type = "line", name = "hovered_symlink" },
    			},
    		},
    		right = {
    			section_a = {},
    			section_b = {},
    			section_c = {
    				{ type = "string", name = "cursor_position" },
    				{ type = "coloreds", name = "count" },
    			},
    		},
    	},
    })
  '';
}
