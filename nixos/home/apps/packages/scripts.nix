{ config, ... }:

{
    home.file = { 
        ".local/bin/bluelight.sh".source = ../../../scripts/bluelight.sh;
        ".local/bin/cheatsheet.sh".source = ../../../scripts/cheatsheet.sh;
        ".local/bin/cliphist.sh".source = ../../../scripts/cliphist.sh;
        ".local/bin/power-menu.sh".source = ../../../scripts/power-menu.sh;
        ".local/bin/power-saver.sh".source = ../../../scripts/power-saver.sh;
    };
}
