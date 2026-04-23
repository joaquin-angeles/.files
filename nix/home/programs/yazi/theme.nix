{ lib, ... }:

{
  programs.yazi.theme = {
    mgr.border_style.fg = "brightblack";

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
        is = "exec";
        fg = "green";
        bold = true;
      })
      (lib.mkOrder 400 {
        name = "*";
        is = "link";
        fg = "cyan";
      })
      (lib.mkOrder 500 {
        name = "*/";
        is = "link";
        fg = "cyan";
      })
      (lib.mkOrder 600 {
        name = "*/";
        bold = true;
        fg = "blue";
      })
    ];
  };
}
