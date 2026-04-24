{ ... }:

{
  programs.yazi.settings = {
    log.enabled = false;

    mgr = {
      show_hidden = false;
      sort_dir_first = true;
      ratio = [
        1
        2
        3
      ];
      show_symlink = false;
    };

    plugin.prepend_fetchers = [
      {
        id = "git";
        name = "*";
        run = "git";
      }
      {
        id = "git";
        name = "*/";
        run = "git";
      }
    ];
  };
}
