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
        return ui.Span("")
      end

      local linked = ""
      if h.link_to ~= nil then
        linked = " -> " .. tostring (h.link_to)
      end
      return ui.Span(" " .. h.name .. linked)
     end
  '';
}
