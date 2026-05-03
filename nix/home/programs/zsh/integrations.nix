{ ... }:

{
  # Better cat
  programs.bat = {
    enable = true;
    config = {
      theme = "base16";
      style = "numbers";
    };
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
      "--icons=always"
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
}
