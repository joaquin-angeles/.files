{ ... }:

{
  programs.waybar.style = ''
    ${builtins.readFile ./style.css}
  '';
}
