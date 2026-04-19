{ config, ... }:

{
  xdg.configFile = {
    "nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.files/vim"; # Text editor
    "river".source = "${config.home.homeDirectory}/.files/river"; # Window manager
    "rmpc".source = "${config.home.homeDirectory}/.files/rmpc"; # Music player

    # Image viewer
    "swayimg/config".text = ''
      [viewer]
      window = #16191acc
      transparency = #16191acc
      background = #16191acc

      [font]
      color = #d4be98ff
      size = 12
      background = #16191acc
      shadow = #00000000
    '';
  };
}
