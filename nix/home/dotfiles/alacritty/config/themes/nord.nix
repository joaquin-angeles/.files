{...}: {
  programs.alacritty.settings = {
    # fzf theming
    env = {
      FZF_DEFAULT_OPTS = "
              --color=spinner:#88C0D0,hl:#81A1C1
              --color=fg:#D8DEE9,header:#81A1C1,info:#EBCB8B,pointer:#B48EAD
              --color=marker:#A3BE8C,fg+:#ECEFF4,prompt:#EBCB8B,hl+:#8FBCBB
              --color=border:#4C566A,label:#D8DEE9,query:#D8DEE9
            ";
    };

    colors.primary = {
      background = "#2E3440";
      foreground = "#D8DEE9";
    };

    colors.normal = {
      black = "#3B4252";
      red = "#BF616A";
      green = "#A3BE8C";
      yellow = "#EBCB8B";
      blue = "#81A1C1";
      magenta = "#B48EAD";
      cyan = "#88C0D0";
      white = "#E5E9F0";
    };

    colors.bright = {
      black = "#4C566A";
      red = "#BF616A";
      green = "#A3BE8C";
      yellow = "#EBCB8B";
      blue = "#81A1C1";
      magenta = "#B48EAD";
      cyan = "#8FBCBB";
      white = "#ECEFF4";
    };
  };

  programs.zsh.initContent = ''
    zstyle ':fzf-tab:*' fzf-flags \
        --color=spinner:#88C0D0,hl:#81A1C1 \
        --color=fg:#D8DEE9,header:#81A1C1,info:#EBCB8B,pointer:#B48EAD \
        --color=marker:#A3BE8C,fg+:#ECEFF4,prompt:#EBCB8B,hl+:#8FBCBB \
        --color=border:#4C566A,label:#D8DEE9,query:#D8DEE9
  '';
}
