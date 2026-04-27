{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # chafa
    cliphist
    lazygit
    nitch
    unstable.impala
  ];
}
