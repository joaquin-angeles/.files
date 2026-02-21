{ ... }:

{
    programs.yazi.theme = {
        filetype = {
            rules = [
                { mime = "inode/directory"; fg = "blue"; bold = true; }
                { name = "*"; is = "orphan"; fg = "red"; }
                { name = "*"; is = "link"; fg = "cyan"; }
                { name = "*/"; is = "orphan"; fg = "red"; }
                { name = "*/"; is = "link"; fg = "cyan"; }
            ];
        };
    };
}
