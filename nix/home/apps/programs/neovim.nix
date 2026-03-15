{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    package = pkgs.unstable.neovim-unwrapped;
    defaultEditor = true; # Set as default
    vimAlias = true; # Fast alias
    extraPackages = with pkgs; [
      alejandra
      lua-language-server
      nixd
      prettier
      stylua
      tree-sitter
      vscode-langservers-extracted
    ];
  };
}
