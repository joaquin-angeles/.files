{ pkgs, ... }:

{
  programs.ncspot = {
    enable = true;
    package = pkgs.unstable.ncspot;
    settings = {
      notify = true;
    };
  };
}
