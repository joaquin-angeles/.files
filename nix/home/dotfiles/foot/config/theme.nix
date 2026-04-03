{ ... }:

{
  imports = [
    ./themes/gruvbox_dark.nix
  ];

  programs.foot.settings = {
    main = {
      pad = "10x10 center";
      gamma-correct-blending = false;
    };

    colors = {
      alpha = 0.8;
    };
  };
}
