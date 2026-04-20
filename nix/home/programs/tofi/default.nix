{ ... }:

{
  programs.tofi = {
    enable = true;
    settings = {
      drun-launch = true;
      anchor = "top";
      width = "100%";
      history = false;
      height = 29;
      horizontal = true;
      font = "monospace";
      font-size = 12;
      prompt-text = ''" ❯ "'';
      text-color = "#d4be98";
      selection-color = "#7daea3";
      placeholder-text = "Type to search…";
      placeholder-color = "#56595a";
      outline-width = 0;
      border-width = 0;
      background-color = "#1d2021";
      min-input-width = 300;
      result-spacing = 25;
      padding-top = 5;
      padding-bottom = 0;
      padding-left = 0;
      padding-right = 2;
    };
  };
}
