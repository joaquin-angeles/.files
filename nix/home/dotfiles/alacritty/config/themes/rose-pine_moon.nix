{ ... }:

{
  programs.alacritty.settings = {
    # fzf theming
    env = {
      FZF_DEFAULT_OPTS = "
              --color=spinner:#ea9a97,hl:#9ccfd8
              --color=fg:#e0def4,header:#9ccfd8,info:#f6c177,pointer:#c4a7e7
              --color=marker:#3e8fb0,fg+:#e0def4,prompt:#f6c177,hl+:#9ccfd8
              --color=border:#6e6a86,label:#e0def4,query:#e0def4
            ";
    };

    colors.primary = {
      background = "#232136";
      foreground = "#e0def4";
    };

    colors.normal = {
      black = "#393552";
      red = "#eb6f92";
      green = "#3e8fb0";
      yellow = "#f6c177";
      blue = "#9ccfd8";
      magenta = "#c4a7e7";
      cyan = "#ea9a97";
      white = "#e0def4";
    };

    colors.bright = {
      black = "#6e6a86";
      red = "#eb6f92";
      green = "#3e8fb0";
      yellow = "#f6c177";
      blue = "#9ccfd8";
      magenta = "#c4a7e7";
      cyan = "#ea9a97";
      white = "#e0def4";
    };
  };

  programs.zsh.initContent = ''
    zstyle ':fzf-tab:*' fzf-flags \
        --color=spinner:#ea9a97,hl:#9ccfd8 \
        --color=fg:#e0def4,header:#9ccfd8,info:#f6c177,pointer:#c4a7e7 \
        --color=marker:#3e8fb0,fg+:#e0def4,prompt:#f6c177,hl+:#9ccfd8 \
        --color=border:#6e6a86,label:#e0def4,query:#e0def4
  '';
}
