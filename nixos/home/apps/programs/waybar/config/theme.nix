{ ... }:

{
    programs.waybar.style = ''
        ${builtins.readFile ./colors.css}
        ${builtins.readFile ./style.css}
    '';
}
