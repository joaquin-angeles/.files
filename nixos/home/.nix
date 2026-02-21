{ config, ... }:

{
    xdg.configFile = {
        "hypr".source = "${config.home.homeDirectory}/.files/hypr";
        "nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.files/neovim";
    };
}
