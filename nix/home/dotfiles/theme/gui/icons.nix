{ config, pkgs, ... }:

{
  systemd.user.services.gruvbox-papirus = {
    Unit = {
      Description = "Install and configure Gruvbox Papirus icon theme";
      After = [ "network-online.target" ];
    };

    Service = {
      Type = "oneshot";
      TimeoutStartSec = "5min";
      ExecStart = "${pkgs.bash}/bin/bash ${config.home.homeDirectory}/.files/bash/gruvbox-papirus.sh";
    };
  };

  systemd.user.timers.gruvbox-papirus = {
    Unit = {
      Description = "Update Gruvbox Papirus icon theme every Saturday";
    };

    Timer = {
      OnCalendar = "Sat *-*-* 10:00:00"; # Every Saturday at 10 AM
      Persistent = true; # Run missed timers on next boot
      RandomizedDelaySec = "30min"; # Random delay up to 30 minutes
    };

    Install = {
      WantedBy = [ "timers.target" ];
    };
  };

  gtk.iconTheme = {
    name = "Papirus-Dark";
    package = null;
  };
}
