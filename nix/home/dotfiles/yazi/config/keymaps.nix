{ ... }:

{
  programs.yazi.keymap = {
    manager.prepend_keymap = [
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
        on = [
          "z"
          "h"
        ];
        run = "hidden toggle";
        desc = "Toggle hidden files";
      }
      {
        on = [ ":" ];
        run = "shell --interactive";
        desc = "Open shell prompt";
      }
      {
        on = [ "!" ];
        run = "shell --interactive --cwd=current";
        desc = "Open shell in current dir";
      }
      {
        on = [ "q" ];
        run = "quit";
        desc = "Quit";
      }
    ];
  };
}
