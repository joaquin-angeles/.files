local utils = require("utils")

Yatline.coloreds.get.hovered_size = function()
	local h = utils.hovered()
	return utils.fmt_size(h and h:size())
end

Yatline.coloreds.get.hovered_mtime = function()
	local h = utils.hovered()
	local t = h and math.floor(h.cha.mtime or 0) or 0
	return utils.fmt_mtime(t)
end

Yatline.coloreds.get.hovered_path = function()
	local cwd = utils.home_short(cx.active.current.cwd)
	local is_root = cwd:match("^[/~]$")

	local child = is_root and "" or (cwd:match("[^/]+$") or "")
	local parent = is_root and cwd or cwd:sub(1, #cwd - #child - 1):gsub("^$", "/")

	local h = utils.hovered()
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
