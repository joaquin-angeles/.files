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
    "hypr/hyprlock.conf".source = "./dotfiles/river/lock.conf";
    "nvim".source = config.lib.file.mkOutOfStoreSymlink "./dotfiles/vim";
    "river".source = "./dotfiles/river";
    "rmpc".source = "./dotfiles/rmpc";
  };
}
