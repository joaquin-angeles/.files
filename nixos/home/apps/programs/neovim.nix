{ pkgs, ... }:

{
    programs.neovim = {
        enable = true;
        package = pkgs.unstable.neovim-unwrapped;
        defaultEditor = true; # Set as default
        vimAlias = true; # Fast alias
        extraPackages = with pkgs.unstable; [
            tree-sitter
            nixd
        ];
    };
}
