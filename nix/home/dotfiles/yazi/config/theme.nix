{ lib, ... }:

{
  programs.yazi.theme = {
    mgr.border_style.fg = "brightblack";

    icon = {
      globs = [ ];
      dirs = [ ];
      files = [ ];
      exts = [ ];
      conds = [ ];
    };

    filetype.rules = [
      (lib.mkOrder 100 {
        name = "*/";
        is = "link";
        fg = "cyan";
        bold = true;
      })
      (lib.mkOrder 200 {
        name = "*";
        is = "link";
        fg = "cyan";
      })
      (lib.mkOrder 300 {
        name = "*/";
        bold = true;
        fg = "blue";
      })
      (lib.mkOrder 400 {
        name = "*/";
        is = "orphan";
        fg = "red";
      })
      (lib.mkOrder 500 {
        name = "*";
        is = "orphan";
        fg = "red";
      })
    ];
  };
}
