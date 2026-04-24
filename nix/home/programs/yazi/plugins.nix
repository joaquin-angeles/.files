{ pkgs, ... }:

{
  programs.yazi = {
    # Plugin installation
    plugins = {
      inherit (pkgs.yaziPlugins)
        chmod
        full-border
        git
        lazygit
        smart-enter
        ;
    };

    # Plugin loading
    initLua = ''
      require("chmod")
      require("git"):setup()
      require("smart-enter")
      require("full-border"):setup({ type = ui.Border.PLAIN })
      require("session"):setup({ sync_yanked = true })

      -- Show symlink path in status bar
      Status:children_add(function(self)
      	local h = self._current.hovered
      	if h and h.link_to then
      		return " -> " .. tostring(h.link_to)
      	else
      		return ""
      	end
      end, 3300, Status.LEFT)
    '';
  };
}
