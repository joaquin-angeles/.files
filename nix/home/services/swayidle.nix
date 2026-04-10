{ pkgs, ... }:

{
  services.swayidle = {
    enable = true;
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
    ];
  };
}
