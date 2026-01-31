{ ... }:

{
    programs.yazi.settings = {

        # Disable log file
        log.enabled = false;

        # Manager configuration
        mgr = {
            show_hidden = false;
            sort_dir_first = true;
            ratio = [ 1 4 3 ];
            title_format = "user@nixos-btw: {cwd}";
            show_symlink = true;
        };
    };
}
