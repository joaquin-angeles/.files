{pkgs, ...}: {
  programs.yazi.plugins = {
    chmod = pkgs.yaziPlugins.chmod;
    full-border = pkgs.yaziPlugins.full-border;
    smart-enter = pkgs.yaziPlugins.smart-enter;
    yatline = pkgs.yaziPlugins.yatline;
  };

  # Plugin configuration
  programs.yazi.initLua = ./init.lua;
}
