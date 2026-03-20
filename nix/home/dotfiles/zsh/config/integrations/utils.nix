{ ... }:
{
  # Better cat
  programs.bat = {
    enable = true;
    config.theme = "ansi";
    config.style = "numbers";
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

  # Grep
  programs.ripgrep = {
    enable = true;
    arguments = [
      "--hidden"
      "--glob"
      "!.git/*"
    ];
  };
}
