{ pkgs, ... }:

{
  home.packages = with pkgs; [
    file-roller
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
