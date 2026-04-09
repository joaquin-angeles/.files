{ pkgs, ... }:

{
  # Better cat
  programs.bat = {
    enable = true;
    config.theme = "ansi";
  };

  # Better cd
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  # eza
  programs.eza = {
    enable = true;
    enableZshIntegration = true;
    extraOptions = [
      "--git"
      "--git-ignore"
      "--group-directories-first"
      "--header"
    ];
  };

  # Find
  programs.fd = {
    enable = true;
    hidden = true;
    extraOptions = [ "--color=always" ];
  };

  # fzf integration
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  # Grep
  programs.ripgrep = {
    enable = true;
    arguments = [
      "--hidden"
      "--glob"
      "!.git/*"
    ];
  };

  # Nix output monitor
  programs.nix-your-shell = {
    enable = true;
    enableZshIntegration = true;
    nix-output-monitor.enable = true;
  };

  # Modern replacements
  home.packages = with pkgs; [
    dust
    ncdu
    procs
    sd
    tokei
    xh
  ];
}
