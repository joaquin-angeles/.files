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
        on = [
          "g"
          "r"
        ];
        run = "cd /";
        desc = "Go root";
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
        on = [ "l" ];
        run = "plugin smart-enter";
      }
      {
        on = [ "enter" ];
        run = "plugin smart-enter";
      }
      {
        on = [
          "g"
          "l"
        ];
        run = "plugin lazygit";
      }
    ];
  };
}
