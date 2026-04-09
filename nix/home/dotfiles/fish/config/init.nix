{ ... }:

{
  home.file.".config/fish/functions/set_cursor.fish".text = ''
    function _set_cursor
      printf "\\e[6 q"
    end
  '';

  home.file.".config/fish/functions/fish_prompt.fish".text = ''
    function fish_prompt
      _set_cursor
      tide prompt
    end
  '';

  programs.fish.interactiveShellInit = ''
    set fish_greeting
  '';
}
