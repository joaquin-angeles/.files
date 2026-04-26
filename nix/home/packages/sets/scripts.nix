{ config, ... }:

{
  home.file = {
    ".local/bin/river-input".source = "${config.home.homeDirectory}/.files/bin/river-input";
    ".local/bin/river-sheet".source = "${config.home.homeDirectory}/.files/bin/river-sheet";
    ".local/bin/river-sticky".source = "${config.home.homeDirectory}/.files/bin/river-sticky";
    ".local/bin/rofi-power-menu".source = "${config.home.homeDirectory}/.files/bin/rofi-power-menu";
  };
}
