{ pkgs, ... }:

{
  home.packages = with pkgs; [
    pcmanfm
    xarchiver

    # core
    gnutar
    gzip
    xz
    zstd

    # compatibility
    zip
    unzip
    p7zip
    unrar

    # nice extras
    pigz
    lz4
    libarchive # for bsdtar
    unp
  ];
}
