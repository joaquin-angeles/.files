{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    package = pkgs.unstable.neovim-unwrapped;
    defaultEditor = true; # Set as default
    vimAlias = true; # Fast alias
    extraPackages = with pkgs; [
      # Mason package manager backends
      nodejs # npm
      nodePackages.npm
      rustup # cargo
      python3 # pip
      python3Packages.pip

      # Language servers
      bash-language-server
      lua-language-server
      vscode-langservers-extracted

      # Formatters
      beautysh
      nixd
      nixfmt
      prettier
      stylua
      tree-sitter
    ];
  };
}
