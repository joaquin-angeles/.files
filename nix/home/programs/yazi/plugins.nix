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
      package.path = package.path
        .. ";" .. os.getenv("HOME") .. "/.config/yazi/lua/?.lua"
        .. ";" .. os.getenv("HOME") .. "/.config/yazi/lua/?/init.lua"

      require("plugins")
      require("yatline")
    '';
  };

  xdg.configFile."yazi/lua".source = ./lua;
}
