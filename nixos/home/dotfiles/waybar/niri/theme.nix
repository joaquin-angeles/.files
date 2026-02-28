{ ... }:

{
    programs.waybar.style = ''
        ${builtins.readFile ./themes/gruvbox_dark.css}
        ${builtins.readFile ./style.css}
    '';
}
