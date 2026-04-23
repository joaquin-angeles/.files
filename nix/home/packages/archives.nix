{ pkgs, ... }:

{
  home.packages = with pkgs; [
    cliphist
    lazygit
    nitch
    unstable.impala
    wl-clipboard
  ];
}
