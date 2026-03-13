{ config, pkgs,  ... }:

{
    # Qt theming
    qt = {
        enable = true;
        platformTheme.name = "qtct";
        style.name = "kvantum-dark";
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

    systemd.user.timers.gruvbox-kvantum = {
        Unit = {
            Description = "Update Gruvbox Kvantum theme every Saturday";
        };

        Timer = {
            OnCalendar = "Sat *-*-* 10:00:00";  # Every Saturday at 10 AM
            Persistent = true;                   # Run missed timers on next boot
            RandomizedDelaySec = "30min";       # Random delay up to 30 minutes
        };

        Install = {
            WantedBy = [ "timers.target" ];
        };
    };
}
