{ config, ... }:

{
    home.file = { 
        ".local/bin/bluelight.sh".source = "${config.home.homeDirectory}/.files/scripts/bluelight.sh";
        ".local/bin/cheatsheet.sh".source = "${config.home.homeDirectory}/.files/scripts/cheatsheet.sh";
        ".local/bin/cliphist.sh".source = "${config.home.homeDirectory}/.files/scripts/cliphist.sh";
        ".local/bin/power-menu.sh".source = "${config.home.homeDirectory}/.files/scripts/power-menu.sh";
        ".local/bin/power-saver.sh".source = "${config.home.homeDirectory}/.files/scripts/power-saver.sh";
    };
}
