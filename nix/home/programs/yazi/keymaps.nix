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
        desc = "Scroll preview down";
      }
      {
        on = [ "K" ];
        run = "seek -5";
        desc = "Scroll preview up";
      }
      {
        on = [ "e" ];
        run = ''shell '$EDITOR "$@"' --confirm'';
        desc = "Edit in $EDITOR";
      }
      {
        on = [ "l" ];
        run = "plugin smart-enter";
        desc = "Enter dir or open file (smart)";
      }
      {
        on = [ "L" ];
        run = ''shell 'if [ -f "$1" ]; then alacritty -e "$EDITOR" "$@" & disown; fi' --confirm'';
        desc = "Open file in new terminal ($EDITOR)";
      }
    ];
  };
}
