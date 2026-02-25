{ config, ... }:

{
    imports = [
        # ./dotfiles/alacritty/package.nix
        ./dotfiles/foot/package.nix
        ./dotfiles/theme/package.nix
        ./dotfiles/waybar/package.nix
        ./dotfiles/yazi/package.nix
        ./dotfiles/zellij/package.nix
        ./dotfiles/zsh/package.nix
    ];

    xdg.configFile = {
        "hypr".source = "${config.home.homeDirectory}/.files/hyprland";
        "nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.files/neovim";
    };
}
