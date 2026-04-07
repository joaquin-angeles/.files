{ ... }:

{
  programs.foot.settings = {
    main = {
      font = "monospace:size=13.5";
      term = "xterm-256color";
    };

    scrollback = {
      lines = 1000;
      indicator-position = "none";
    };
  };
}
