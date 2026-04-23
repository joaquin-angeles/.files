{ config, lib, ... }:

let
  browser = "librewolf.desktop";
  editor = "nvim.desktop";
  archive = "xarchiver.desktop";
  files = "pcmanfm.desktop";
  image = "swayimg.desktop";
  mkMime = app: types: lib.listToAttrs (map (t: lib.nameValuePair t app) types);
in
{
  xdg = {
    enable = true;
    configFile = {
      "nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.files/vim"; # Text editor
      "river".source = "${config.home.homeDirectory}/.files/river"; # Window manager
      # "rmpc".source = "${config.home.homeDirectory}/.files/rmpc"; # Music player

      # Image viewer
      "swayimg/config".text = ''
        [viewer]
        window = #16191acc
        transparency = #16191acc
        background = #16191acc

        [font]
        color = #d4be98ff
        size = 12
        background = #16191acc
        shadow = #00000000
      '';
    };
    mimeApps = {
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
        (mkMime image [
          "image/png"
          "image/jpeg"
          "image/jpg"
          "image/gif"
          "image/webp"
          "image/bmp"
          "image/tiff"
          "image/svg+xml"
        ])
      ];
    };
  };

}
