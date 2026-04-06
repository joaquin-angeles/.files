{ ... }:

{
  programs.waybar.style = ''
    ${builtins.readFile ./themes/colors.css}
    ${builtins.readFile ./themes/style.css}
  '';
}
