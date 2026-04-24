{ lib, ... }:

{
  programs.yazi.theme = {
    mgr.border_style.fg = "brightblack";

    mode = {
      normal_main = {
        fg = "black";
        bg = "blue";
        bold = true;
      };
      normal_alt = {
        fg = "blue";
        bg = "black";
      };

      select_main = {
        fg = "black";
        bg = "red";
        bold = true;
      };
      select_alt = {
        fg = "red";
        bg = "black";
      };

      unset_main = {
        fg = "black";
        bg = "red";
        bold = true;
      };
      unset_alt = {
        fg = "yellow";
        bg = "red";
      };
    };

    filetype.rules = [
      (lib.mkOrder 1 {
        name = "*";
        is = "orphan";
        fg = "red";
      })
      (lib.mkOrder 2 {
        name = "*/";
        is = "orphan";
        fg = "red";
      })
      (lib.mkOrder 3 {
        name = "*";
        is = "link";
        fg = "cyan";
      })
      (lib.mkOrder 4 {
        name = "*/";
        is = "link";
        fg = "cyan";
      })
      (lib.mkOrder 5 {
        name = "*";
        is = "exec";
        fg = "green";
        bold = true;
      })
      (lib.mkOrder 6 {
        mime = "image/*";
        fg = "magenta";
      })
      (lib.mkOrder 7 {
        name = "*/";
        bold = true;
        fg = "blue";
      })
    ];
  };
}
