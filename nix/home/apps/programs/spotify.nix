{ config, pkgs, ... }:

{
  sops.secrets = {
    "mopidy-spotify-client-id" = { };
    "mopidy-spotify-client-secret" = { };
    "mopidy-spotify-username" = { };
    "mopidy-spotify-password" = { };
  };

  sops.templates."mopidy-spotify.conf" = {
    content = ''
      [spotify]
      client_id = ${config.sops.placeholder."mopidy-spotify-client-id"}
      client_secret = ${config.sops.placeholder."mopidy-spotify-client-secret"}
      username = ${config.sops.placeholder."mopidy-spotify-username"}
      password = ${config.sops.placeholder."mopidy-spotify-password"}
    '';
  };

  services.mopidy = {
    enable = true;

    extensionPackages = with pkgs; [
      mopidy-spotify
      mopidy-mpd # exposes the MPD interface that rmpc connects to
    ];

    settings = {
      mpd = {
        enabled = true;
        hostname = "127.0.0.1";
        port = 6600;
      };
      audio = {
        output = "autoaudiosink";
      };
      spotify = {
        enable = true;
      };
    };

    extraConfigFiles = [
      config.sops.templates."mopidy-spotify.conf".path
    ];
  };

  programs.ncmpcpp = {
    enable = true;

    settings = {
      mpd_host = "127.0.0.1";
      mpd_port = "6600";
    };

    bindings = [
      {
        key = "j";
        command = "scroll_down";
      }
      {
        key = "k";
        command = "scroll_up";
      }
      {
        key = "h";
        command = "previous_column";
      }
      {
        key = "l";
        command = "next_column";
      }
      {
        key = "ctrl-d";
        command = "page_down";
      }
      {
        key = "ctrl-u";
        command = "page_up";
      }
      {
        key = "g";
        command = "move_home";
      }
      {
        key = "G";
        command = "move_end";
      }
    ];
  };
}
