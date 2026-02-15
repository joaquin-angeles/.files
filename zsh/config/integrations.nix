{ pkgs, ... }:

{
    imports = [
        ./integrations/utils.nix
        ./integrations/search.nix
    ];

    # Nix output monitor
    programs.nix-your-shell = {
        enable = true;
        enableZshIntegration = true;
        nix-output-monitor.enable = true;
    };
}
