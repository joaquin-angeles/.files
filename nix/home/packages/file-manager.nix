{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # GUI File manager
    pcmanfm

    # Termminal file manager
    lf
    chafa # Image previews

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
