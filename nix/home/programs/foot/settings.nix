{ ... }:

{
  programs.foot.settings = {
    # Font configuration
    main = {
      font = "monospace:size=13";
      term = "xterm-256color";
    };

    # Minimal scrollback
    scrollback = {
      lines = 1000;
      indicator-position = "none";
    };

    cursor.style = "beam"; # Cursor style
    environment.TERM = "xterm-256color"; # TERM correction
  };
}
