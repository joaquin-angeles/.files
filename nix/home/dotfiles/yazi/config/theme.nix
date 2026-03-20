{ ... }:
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
    filetype = {
      rules = [
        {
          mime = "inode/directory";
          fg = "blue";
          bold = true;
        }
        {
          name = "*/";
          is = "orphan";
          fg = "red";
        }
        {
          name = "*";
          is = "orphan";
          fg = "red";
        }
        {
          name = "*/";
          is = "link";
          fg = "cyan";
          bold = true;
        }
        {
          name = "*";
          is = "link";
          fg = "cyan";
        }
      ];
    };
  };
}
