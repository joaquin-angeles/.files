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
        yatline
        ;
    };

    # Plugin loading
    initLua = ''
      local M = {}

      M.base = (os.getenv("YAZI_CONFIG_HOME") or (os.getenv("HOME") .. "/.config/yazi")) .. "/lua/"

      function M.load(path)
      	return dofile(M.base .. path)
      end

      M.load("plugins.lua")
      M.load("yatline/init.lua")
    '';
  };

  xdg.configFile."yazi/lua".source = ./lua;
}
