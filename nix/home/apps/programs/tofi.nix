{ pkgs, ... }:

{
  programs.tofi = {
    enable = true;
    settings = {
      anchor = "bottom";
      width = "100%";
      height = 30;
      horizontal = true;
      drun-launch = true;
      history = false;
      hint-font = true;
      font-size = "12pt";
      font = "${pkgs.nerd-fonts.jetbrains-mono}/share/fonts/truetype/NerdFonts/JetBrainsMono/JetBrainsMonoNerdFontMono-Regular.ttf";
      prompt-text = ''"> "'';
      outline-width = 0;
      border-width = 0;
      background-color = "#1d2021";
      selection-color = "#7daea3";
      text-color = "#d4be98";
      selection-background-padding = "0, 5";
      num-results = 8;
      min-input-width = 400;
      result-spacing = 30;
      padding-top = 5;
      padding-bottom = 0;
      padding-left = 5;
      padding-right = 0;
      placeholder-text = "Type to search…";
      placeholder-color = "#56595a";
    };
  };
}
