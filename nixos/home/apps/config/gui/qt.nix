{ config, pkgs,  ... }:

{
    # Qt theming
    qt = {
        enable = true;
        platformTheme.name = "qtct";
        style = {
            name = "kvantum-dark";
        };
    };


    systemd.user.services.gruvbox-kvantum = {
        Unit = {
            Description = "Install and configure Gruvbox Papirus icon theme";
            After = [ "network-online.target" ];
        };

        Service = {
            Type = "oneshot";
            TimeoutStartSec = "15min";
            ExecStart = "${pkgs.bash}/bin/bash ${config.home.homeDirectory}/.files/scripts/gruvbox-kvantum.sh";
        };
    };
}
