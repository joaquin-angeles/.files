{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    package = pkgs.unstable.neovim-unwrapped;
    defaultEditor = true; # Set as default
    vimAlias = true; # Fast alias
    extraPackages = with pkgs; [
      # Requirements
      git
      curl
      wget
      tree-sitter

      # Mason package manager backends
      nodejs # npm
      nodePackages.npm
      cargo # Rust package manager
      rustc
      python3 # pip

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
