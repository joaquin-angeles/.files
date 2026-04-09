{ pkgs, ... }:

{
  programs.fish = {
    plugins = [
      {
        name = "tide";
        src = pkgs.fishPlugins.tide;
      }
    ];
  };
}
