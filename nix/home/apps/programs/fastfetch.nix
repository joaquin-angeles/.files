{ ... }:

{
  programs.fastfetch = {
    enable = true;
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
          key = "os    ";
        }
        {
          type = "kernel";
          key = "kernel";
          format = "{2}";
        }
        {
          type = "packages";
          key = "pkgs  ";
          format = "{9} (core), {10} (home)";
        }
        {
          type = "shell";
          key = "sh    ";
          format = "{3} {4}";
        }
        {
          type = "de";
          key = "de    ";
          format = "{2}";
        }
        {
          type = "wm";
          key = "wm    ";
          format = "{2} {5} ({3})";
        }
        {
          type = "uptime";
          key = "uptime";
        }
        {
          type = "disk";
          key = "disk  ";
          format = "{1} / {2} ({3})";
        }
        {
          type = "memory";
          key = "memory";
        }
        {
          type = "swap";
          key = "swap  ";
        }
        {
          type = "custom";
          format = "{#37}*{#} {#37}*{#} {#36}*{#} {#35}*{#} {#34}*{#} {#33}*{#} {#32}*{#} {#31}*{#}";
        }
      ];
    };
  };
}
