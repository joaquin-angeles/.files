{ ... }:

{
  programs.waybar.style = ''
    ${builtins.readFile ./theme/colors.css}
    ${builtins.readFile ./theme/style.css}
  '';
}
