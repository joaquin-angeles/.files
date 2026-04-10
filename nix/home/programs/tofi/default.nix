{ pkgs, ... }:

{
  programs.tofi = {
    enable = true;
    settings = {
      drun-launch = true;
      anchor = "bottom";
      width = "100%";
      history = false;
      height = 30;
      horizontal = true;
      font = "sans-serif";
      font-size = 12;
      prompt-text = ''" > "'';
      text-color = "#d4be98";
      selection-color = "#7daea3";
      placeholder-text = "Type to search…";
      placeholder-color = "#56595a";
      outline-width = 0;
      border-width = 0;
      background-color = "#1d2021";
      min-input-width = 300;
      result-spacing = 20;
      padding-top = 5;
      padding-bottom = 0;
      padding-left = 0;
      padding-right = 0;
    };
  };
}
