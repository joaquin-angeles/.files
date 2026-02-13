{ ... }:

{
    programs.waybar.style = ''
        ${builtins.readFile ./themes/gruvbox-dark.css}
        ${builtins.readFile ./style.css}
    '';
}
