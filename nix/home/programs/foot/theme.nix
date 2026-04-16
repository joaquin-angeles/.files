{ ... }:

{
  programs.foot.settings = {
    main = {
      pad = "5x5 center";
      gamma-correct-blending = false;
    };

    # Colorscheme
    colors = {
      # Alpha transparency
      alpha = 0.8;

      background = "1d2021";
      foreground = "d4be98";

      regular0 = "1d2021"; # black
      regular1 = "ea6962"; # red
      regular2 = "a9b665"; # green
      regular3 = "d8a657"; # yellow
      regular4 = "7daea3"; # blue
      regular5 = "d3869b"; # magenta
      regular6 = "89b482"; # cyan
      regular7 = "d4be98"; # white

      bright0 = "56595a"; # black
      bright1 = "ea6962"; # red
      bright2 = "a9b665"; # green
      bright3 = "d8a657"; # yellow
      bright4 = "7daea3"; # blue
      bright5 = "d3869b"; # magenta
      bright6 = "89b482"; # cyan
      bright7 = "d4be98"; # white
    };

    # TERM correction
    environment.TERM = "xterm-256color";
  };
}
