{ pkgs, ... }:

let
  xarchiverWrapped = pkgs.xarchiver.overrideAttrs (old: {
    nativeBuildInputs = (old.nativeBuildInputs or [ ]) ++ [ pkgs.makeWrapper ];

    postInstall = (old.postInstall or "") + ''
      wrapProgram $out/bin/xarchiver \
        --prefix PATH : ${
          pkgs.lib.makeBinPath [
            pkgs.gnutar
            pkgs.gzip
            pkgs.xz
            pkgs.zstd
            pkgs.zip
            pkgs.unzip
            pkgs.p7zip
            pkgs.unrar
            pkgs.pigz
            pkgs.lz4
            pkgs.libarchive
            pkgs.unp
          ]
        }
    '';
  });
in
{
  home.packages = with pkgs; [
    pkgs.pcmanfm
    xarchiverWrapped
  ];
}
