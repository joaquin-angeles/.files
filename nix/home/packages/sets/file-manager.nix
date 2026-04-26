{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # File managers
    pcmanfm
    # lf
    xarchiver

    # CLI tools
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
