{ ... }:

{
  programs.alacritty.settings = {
    # fzf theming
    env = {
      FZF_DEFAULT_OPTS = "
        --color=spinner:#89b482,hl:#7daea3
        --color=fg:#d4be98,header:#7daea3,info:#d8a657,pointer:#d3869b
        --color=marker:#a9b665,fg+:#d4be98,prompt:#d8a657,hl+:#9cd9cb
        --color=border:#575A5B,label:#d4be98,query:#d4be98
      ";
    };

    colors = {
      primary = {
        background = "#1d2021";
        foreground = "#d4be98";
      };

      normal = {
        black = "#1d2021";
        red = "#ea6962";
        green = "#a9b665";
        yellow = "#d8a657";
        blue = "#7daea3";
        magenta = "#d3869b";
        cyan = "#89b482";
        white = "#d4be98";
      };

      bright = {
        black = "#56595a";
        red = "#ea6962";
        green = "#a9b665";
        yellow = "#d8a657";
        blue = "#7daea3";
        magenta = "#d3869b";
        cyan = "#89b482";
        white = "#d4be98";
      };
    };
  };

  programs.zsh.initContent = ''
    zstyle ':fzf-tab:*' fzf-flags \
        --color=spinner:#89b482,hl:#7daea3 \
        --color=fg:#d4be98,header:#7daea3,info:#d8a657,pointer:#d3869b \
        --color=marker:#a9b665,fg+:#d4be98,prompt:#d8a657,hl+:#9cd9cb \
        --color=border:#575A5B,label:#d4be98,query:#d4be98
  '';
}
