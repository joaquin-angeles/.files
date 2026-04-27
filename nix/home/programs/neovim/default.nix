{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    package = pkgs.unstable.neovim-unwrapped;
    defaultEditor = true; # Set as default
    vimAlias = true; # Fast alias
    extraPackages = with pkgs; [
      tree-sitter # Highlighter CLI for nvim-treesitter

      # Language servers
      bash-language-server
      lua-language-server
      nixd

      # Formatters
      beautysh
      prettier
      stylua
      unstable.nixfmt
    ];
  };
}
