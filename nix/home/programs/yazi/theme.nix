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
        bg = "yellow";
        bold = true;
      };
      select_alt = {
        fg = "yellow";
        bg = "black";
      };

      unset_main = {
        fg = "black";
        bg = "red";
        bold = true;
      };
      unset_alt = {
        fg = "red";
        bg = "black";
      };
    };

    filetype.rules = [
      (lib.mkOrder 100 {
        name = "*";
        is = "orphan";
        fg = "red";
      })
      (lib.mkOrder 200 {
        name = "*/";
        is = "orphan";
        fg = "red";
      })
      (lib.mkOrder 300 {
        name = "*";
        is = "link";
        fg = "cyan";
      })
      (lib.mkOrder 400 {
        name = "*/";
        is = "link";
        fg = "cyan";
      })
      (lib.mkOrder 500 {
        name = "*";
        is = "exec";
        fg = "green";
        bold = true;
      })
      (lib.mkOrder 600 {
        mime = "image/*";
        fg = "magenta";
      })
      (lib.mkOrder 700 {
        name = "*/";
        bold = true;
        fg = "blue";
      })
    ];
  };
}
