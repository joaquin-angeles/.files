{ config, ... }:

{
    xdg.configFile = {
        "hypr".source = "${config.home.homeDirectory}/.files/hypr";
        "Kvantum".source = "${config.home.homeDirectory}/.files/qt";
        "nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.files/neovim";
        # "waybar".source = "${config.home.homeDirectory}/.files/waybar";
        # "zellij".source = "${config.home.homeDirectory}/.files/zellij";
    };
}
