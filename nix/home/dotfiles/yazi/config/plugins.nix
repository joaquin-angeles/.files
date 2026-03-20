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

    initLua = ./init.lua; # Plugin configuration
  };
}
