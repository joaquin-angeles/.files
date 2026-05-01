local M = {}

M.base = (os.getenv("YAZI_CONFIG_HOME") or (os.getenv("HOME") .. "/.config/yazi")) .. "/lua/"

function M.load(path)
	return dofile(M.base .. path)
end

local utils = M.load("utils.lua")

Yatline.line.get.hovered_symlink = function()
	local h = utils.hovered()
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
