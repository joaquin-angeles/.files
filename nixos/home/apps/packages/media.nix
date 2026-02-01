{ pkgs, ... }:

{
    # Media tools
    home.packages = with pkgs; [
        celluloid
        imv
        unstable.wiremix
    ];
}
