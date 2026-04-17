{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    package = pkgs.unstable.neovim-unwrapped;
    defaultEditor = true; # Set as default
    vimAlias = true; # Fast alias
    extraPackages = with pkgs; [
      bash-language-server
      beautysh
      lua-language-server
      nixd
      nixfmt
      prettier
      stylua
      tree-sitter
      vscode-langservers-extracted
    ];
  };
}
