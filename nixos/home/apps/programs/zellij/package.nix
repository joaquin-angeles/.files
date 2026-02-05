{ ... }:

{
    # Modules
    imports = [
        ./config/binds.nix
        ./config/settings.nix
    ];

    # Installation
    programs.zellij = {
        enable = true;
        enableZshIntegration = true;
    };
}
