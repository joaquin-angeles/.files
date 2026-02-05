{ config, ... }:

{
    home.file = { 
        ".local/bin/bluelight.sh".source = ~/.files/scripts/bluelight.sh;
        ".local/bin/cheatsheet.sh".source = ~/.files/scripts/cheatsheet.sh;
        ".local/bin/cliphist.sh".source = ~/.files/scripts/cliphist.sh;
        ".local/bin/power-menu.sh".source = ~/.files/scripts/power-menu.sh;
        ".local/bin/power-saver.sh".source = ~/.files/scripts/power-saver.sh;
    };
}
