{ config, pkgs, ... }:

let
  hostname = builtins.replaceStrings [ "\n" ] [ "" ] (builtins.readFile /etc/hostname);
in
{
  programs.yazi.settings = {
    # Disable log file
    log.enabled = false;

    # Opener configuration
    opener = {
      image = [
        {
          run = "${pkgs.swayimg}/bin/swayimg %s";
          orphan = true;
          desc = "View image";
        }
      ];
    };

    open = {
      rules = [
        {
          mime = "image/*";
          use = [ "image" ];
        }
      ];
    };

    # Manager configuration
    mgr = {
      show_hidden = false;
      sort_dir_first = true;
      ratio = [
        1
        2
        3
      ];
      title_format = "${config.home.username}@${hostname}: {cwd}";
      show_symlink = false;
    };

    plugin.prepend_fetchers = [
      {
        id = "git";
        name = "*";
        run = "git";
      }
      {
        id = "git";
        name = "*/";
        run = "git";
      }
    ];
  };
}
