{ pkgs, lib, ... }:

{
  programs.zsh.initContent = lib.mkAfter ''
    source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
    source ${pkgs.zsh-fast-syntax-highlighting}/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

    source ${pkgs.zsh-defer}/share/zsh-defer/zsh-defer.plugin.zsh
    zsh-defer source ${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  '';
}
