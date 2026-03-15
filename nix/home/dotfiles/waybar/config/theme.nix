{...}: {
  programs.waybar.style = ''
    ${builtins.readFile ./themes/colors/gruvbox_dark.css}
    ${builtins.readFile ./themes/style.css}
  '';
}
