{ ... }:

{
  programs.yazi.keymap = {
    mgr.prepend_keymap = [
      {
        on = [
          "g"
          "h"
        ];
        run = "cd ~";
        desc = "Go home";
      }
      {
        on = [ "J" ];
        run = "seek 5";
      }
      {
        on = [ "K" ];
        run = "seek -5";
      }
      {
        on = [
          "g"
          "l"
        ];
        run = "plugin lazygit";
      }
      {
        on = [ "l" ];
        run = "plugin smart-enter";
      }
      {
        on = [ "enter" ];
        run = "plugin smart-enter";
      }
      {
        on = [ "u" ];
        run = "unyank";
      }
      {
        on = [ "U" ];
        run = [
          "unyank"
          "escape --select"
        ];
      }
    ];
  };
}
