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
      local config = ya.conf_dir()

      package.path = table.concat({
        package.path,
        config .. "/config/?.lua",
        config .. "/config/?/init.lua",
      }, ";")

      require("config.plugins")
      require("config.yatline")
      require("config.yatline.coloreds")
      require("config.yatline.lines")
    '';
  };

  xdg.configFile."yazi/config".source = ./config;
}
