local M = {}

function M.hovered()
	return cx.active.current.hovered
end

function M.readable_size(s)
	return s and ya.readable_size(s) or nil
end

function M.fmt_size(s)
	return s and { { " " .. M.readable_size(s) .. "  ", "green" } } or { { " -  ", "brightblack" } }
end

function M.fmt_mtime(t)
	if t == 0 then
		return {}
	end
	local fmt = os.date("%Y", t) == os.date("%Y") and "%d %b %H:%M" or "%d %b %Y"
	return { { os.date(fmt, t), "blue" } }
end

function M.home_short(path)
	local home = (os.getenv("HOME") or ""):gsub("/$", "")
	return tostring(path):gsub("^" .. home, "~")
end

return M
