{ ... }:

{
  programs.yazi.initLua = ''
    require("chmod")
    require("git"):setup()
    require("smart-enter")
    require("full-border"):setup({ type = ui.Border.PLAIN })
    require("session"):setup({ sync_yanked = true })

    -- Show symlink path in status bar
    function Status:name()
    	local h = cx.active.current.hovered
    	if not h then
    		return ui.Line({})
    	end
    	local spans = { ui.Span(" " .. h.name) }
    	if h.link_to ~= nil then
    		table.insert(spans, ui.Span(" -> "):fg("brightblack"))
    		table.insert(spans, ui.Span(tostring(h.link_to)):fg("cyan"))
    	end
    	return ui.Line(spans)
    end
  '';
}
