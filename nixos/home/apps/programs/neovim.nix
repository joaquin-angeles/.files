{ pkgs, ... }:

{
    programs.neovim = {
        enable = true;
        package = pkgs.unstable.neovim-unwrapped; # Use custom wrapper
        defaultEditor = true; # Set as default
        vimAlias = true; # Fast alias
        extraPackages = with pkgs; [
            alejandra
            lua-language-server
            nixd
            tree-sitter
            vscode-langservers-extracted
        ];
    };
}
