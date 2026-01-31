{ pkgs, ... }:

{
    # Lutris
    programs.lutris = {
        enable = true;
        protonPackages = with pkgs; [ unstable.proton-ge-bin ]; # Windows games

        # Patches
        package = pkgs.lutris.override {
            extraPkgs =  with pkgs; [
                # Tray support
                libayatana-appindicator
                libappindicator-gtk3
            ];
        };

        # Extra libraries
        extraPackages = with pkgs; [
            gamemode
            gamescope # Micro-compositor
            mangohud # FPS counter
            umu-launcher # Steam libraries
            unstable.wineWowPackages.stagingFull
        ];
    };
}
