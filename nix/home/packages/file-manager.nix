{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # GUI File manager
    pcmanfm

    # Terminal file manager
    lf
    chafa

    # Archive manager
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
