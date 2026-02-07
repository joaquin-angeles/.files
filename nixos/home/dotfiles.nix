{ config, ... }:

{
    xdg.configFile = {
        "hypr".source = ~/.files/hypr;
        "Kvantum".source = ~/.files/qt;
        "nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.files/neovim";
        "waybar".source = ~/.files/waybar;
        # "zellij".source = ~/.files/zellij;
    };
}
