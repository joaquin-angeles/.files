{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Thunar file manager
    xfce.thunar
    xfce.thunar-archive-plugin
    xfce.thunar-volman

    # Archive management
    xarchiver
    gnutar
    gzip
    xz
    zstd
    zip
    unzip
    p7zip
    unrar
    pigz
    lz4
    libarchive
    unp
  ];
}
