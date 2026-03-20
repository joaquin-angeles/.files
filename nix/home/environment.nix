{
  config,
  pkgs,
  lib,
  ...
}:
let
  browser = "app.zen_browser.zen.desktop";
  editor = "nvim.desktop";
  archive = "org.gnome.FileRoller.desktop";
  files = "org.gnome.Nautilus.desktop";

  mkMime = app: types: lib.listToAttrs (map (t: lib.nameValuePair t app) types);
in
{
  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    GTK_DECORATION_LAYOUT = ":";
    GIO_EXTRA_MODULES = "${pkgs.gvfs}/lib/gio/modules";
    NIXOS_OZONE_WL = "1";
    MANPAGER = "bat -l man --style=plain'";
    RUSTUP_HOME = "${config.home.homeDirectory}/.local/share/rustup";
    WLR_NO_HARDWARE_CURSORS = "1";
  };

  home.sessionPath = [
    "${config.home.homeDirectory}/.local/bin"
    "${config.home.homeDirectory}/.cargo/bin"
    "${pkgs.stdenv.cc}/bin"
  ];

  xdg.enable = true;
  xdg.mimeApps = {
    enable = true;
    defaultApplications = lib.mkMerge [
      (mkMime browser [
        "text/html"
        "x-scheme-handler/http"
        "x-scheme-handler/https"
        "x-scheme-handler/about"
        "x-scheme-handler/unknown"
      ])
      (mkMime editor [
        "text/plain"
        "text/markdown"
        "application/json"
        "application/x-yaml"
        "application/x-shellscript"
        "text/x-rust"
        "text/x-csrc"
        "text/x-chdr"
        "text/x-c++"
        "text/x-c++hdr"
        "text/x-python"
        "text/x-java"
        "text/x-go"
        "text/x-kotlin"
        "text/x-php"
        "text/x-ruby"
        "text/x-sql"
      ])
      (mkMime archive [
        "application/zip"
        "application/x-tar"
        "application/x-bzip2"
        "application/x-xz"
        "application/gzip"
        "application/x-7z-compressed"
        "application/x-rar"
      ])
      (mkMime files [
        "inode/directory"
        "x-directory/normal"
      ])
    ];
  };
}
