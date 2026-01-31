{ pkgs, ... }:

{
    programs.yazi.plugins = {
        chmod = pkgs.yaziPlugins.chmod;
        full-border = pkgs.yaziPlugins.full-border;
        smart-enter = pkgs.yaziPlugins.smart-enter;
        yatline = pkgs.yaziPlugins.yatline;
    };

    programs.yazi.initLua = ./init.lua;
}
