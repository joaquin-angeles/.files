{ ... }:

{
  programs.foot.settings = {
    main = {
      pad = "10x10 center";
      gamma-correct-blending = false;
    };

    colors = {
      alpha = 0.8;
    };

    # Colorscheme
    colors = {
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

    # FZF Colorscheme
    environment = {
      FZF_DEFAULT_OPTS = "--color=spinner:#89b482,hl:#7daea3 --color=fg:#d4be98,header:#7daea3,info:#d8a657,pointer:#d3869b --color=marker:#a9b665,fg+:#d4be98,prompt:#d8a657,hl+:#9cd9cb --color=border:#56595a,label:#d4be98,query:#d4be98";
    };
  };
}
