{ lib, ... }:

let
  browser = "zen.desktop";
  editor = "nvim.desktop";
  archive = "org.gnome.FileRoller.desktop";
  files = "nemo.desktop";

  mkMime = app: types: lib.listToAttrs (map (t: lib.nameValuePair t app) types);
in
{
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
