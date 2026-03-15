{ config, ... }:


let
    hostname = builtins.replaceStrings ["\n"] [""] (builtins.readFile /etc/hostname);
in {
    programs.yazi.settings = {

        # Disable log file
        log.enabled = false;

        # Manager configuration
        mgr = {
            show_hidden = false;
            sort_dir_first = true;
            ratio = [ 1 3 2 ];
            title_format = "${config.home.username}@${hostname}: {cwd}";
            show_symlink = true;
        };
    };
}
