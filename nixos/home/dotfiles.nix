{ config, ... }:

{
    xdg.configFile = {
        "hypr".source = ../../hypr;
        "Kvantum".source = ../../qt;
        "mako".source = ../../mako;
        "nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.files/neovim";
        "waybar".source = ../../waybar;
        "zellij".source = ../../zellij;
    };
}
