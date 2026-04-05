{ ... }:

{
  programs.tofi = {
    enable = true;
    settings = {
      anchor = "bottom";
      width = "100%";
      height = 30;
      horizontal = true;
      font-size = 12;
      font = "monospace";
      prompt-text = ''" > "'';
      outline-width = 0;
      border-width = 0;
      background-color = "#1d2021";
      selection-color = "#7daea3";
      text-color = "#56595a";
      selection-background-padding = "0, 5";
      num-results = 8;
      min-input-width = 300;
      result-spacing = 20;
      padding-top = 4;
      padding-bottom = 0;
      padding-left = 5;
      padding-right = 0;
      hint-font = false;
      placeholder-text = "Type to search...";
      placeholder-color = "#56595a";
    };
  };
}
