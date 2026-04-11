{ pkgs, ... }:

{
  services.swayidle = {
    # Installation
    enable = true;
    systemdTarget = "graphical-session.target"; # Require graphical interface

    # Configuration
    extraArgs = [ "-w" ];
    timeouts = [
      {
        timeout = 300;
        command = "${pkgs.gtklock}/bin/gtklock";
      }
      {
        timeout = 600;
        command = "${pkgs.wlopm}/bin/wlopm --off \"*\"";
        resumeCommand = "${pkgs.wlopm}/bin/wlopm --on \"*\"";
      }
      {
        timeout = 900;
        command = "${pkgs.systemd}/bin/systemctl suspend";
      }
    ];
    events = [
      {
        event = "before-sleep";
        command = "${pkgs.gtklock}/bin/gtklock";
      }
      {
        event = "after-resume";
        command = "${pkgs.wlopm}/bin/wlopm --on \"*\"";
      }
    ];
  };
}
