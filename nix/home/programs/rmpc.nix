{ pkgs, ... }:

{
  services.mpd = {
    enable = true;
    musicDirectory = "~/Music";
    network.startWhenNeeded = true;

    extraConfig = ''
      audio_output {
        type "pipewire"
        name "PipeWire Sound Server"
      }
    '';
  };

  # Mpris compatibility
  services.mpd-mpris.enable = true;

  programs.rmpc = {
    enable = true;
    package = pkgs.unstable.rmpc;
  };

  home.packages = with pkgs; [
    mpc
  ];
}
