{ ... }:

{
    # Modules
    imports = [
        ./config/settings.nix
    ];

    # Installation
    programs.zellij.enable = true;
}
