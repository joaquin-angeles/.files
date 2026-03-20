{ lib, ... }:

{
  programs.zsh.initContent = lib.mkAfter ''
    bindkey '^P' history-substring-search-up
    bindkey '^N' history-substring-search-down
  '';
}
