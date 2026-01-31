{ ... }:

{
    programs.alacritty = {
        # Config / alacritty.toml
        settings = {

            # Window padding
            window = {
                opacity = 0.8; # Transparency
                padding = {
                    x = 10;
                    y = 10;
                };
                dynamic_padding = true;
            };

            # Color scheme (Gruvbox material)
            colors.primary = {
                background = "#1d2021";
                foreground = "#d4be98";
            };

            colors.normal = {
                black   = "#1d2021";
                red     = "#ea6962";
                green   = "#a9b665";
                yellow  = "#d8a657";
                blue    = "#7daea3";
                magenta = "#d3869b";
                cyan    = "#89b482";
                white   = "#d4be98";
            };

            colors.bright = {
                black   = "#4d5051";
                red     = "#ef8e89";
                green   = "#bec88c";
                yellow  = "#e2bc81";
                blue    = "#9ec2ba";
                magenta = "#dea4b4";
                cyan    = "#a6c7a1";
                white   = "#dfceb2";
            };
        };
    };
}
