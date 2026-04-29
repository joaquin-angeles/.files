{ pkgs, ... }:

{
  programs.fastfetch = {
    enable = true;
    package = pkgs.fastfetchMinimal;
    settings = {
      "$schema" = "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json";

      display = {
        separator = " ";
      };

      logo = {
        type = "small";
        padding = {
          top = 1;
        };
      };

      modules = [
        {
          type = "title";
          color = {
            user = "white";
            at = "red";
            host = "white";
          };
        }
        {
          type = "os";
          key = "";
        }
        {
          type = "kernel";
          key = "";
          format = "{2}";
        }
        {
          type = "packages";
          key = "󰏖";
          combined = true;
        }
        {
          type = "shell";
          key = "";
          format = "{3} {4}";
        }
        {
          type = "de";
          key = "";
          format = "{2}";
        }
        {
          type = "wm";
          key = "";
        }
        {
          type = "uptime";
          key = "󰋚";
        }
        {
          type = "disk";
          key = "";
          format = "{1} / {2} ({3})";
        }
        {
          type = "memory";
          key = "󰍛";
        }
        {
          type = "swap";
          key = "󰾴";
        }
        {
          type = "custom";
          format = "{#30}●{#} {#31}●{#} {#32}●{#} {#33}●{#} {#34}●{#} {#35}●{#} {#36}●{#} {#37}●{#}";
        }
      ];
    };
  };
}
