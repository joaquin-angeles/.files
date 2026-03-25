{ ... }:

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

  programs.rmpc = {
    enable = true;
    config = ''
      (
        address: "127.0.0.1:6600",
        password: None,
        theme: None,
        volume_step: 5,
        max_fps: 30,
        enable_mouse: true,
        enable_config_hot_reload: true,
        status_update_interval_ms: 1000,
      )
    '';
  };
}
