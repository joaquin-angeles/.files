{ ... }:

{
    # Btop
    programs.btop = {
        enable = true;

        # Theming settings
        settings = {
            color_theme = "gruvbox_material_dark"; # Preferred colorscheme
            theme_background = false; # Enable transparency
        };
    };
}
