{ ... }:

{
    programs.alacritty = {
        # Define colors
        settings.colors = {
            primary = {
                background = "#1d2021";
                foreground = "#d4be98";
            };

            normal = {
                black   = "#1d2021";
                red     = "#ea6962";
                green   = "#a9b665";
                yellow  = "#d8a657";
                blue    = "#7daea3";
                magenta = "#d3869b";
                cyan    = "#89b482";
                white   = "#d4be98";
            };

            bright = {
                black   = "#4b5153";
                red     = "#ff837a";
                green   = "#d3e37e";
                yellow  = "#ffcf6c";
                blue    = "#9cd9cb";
                magenta = "#ffa7c1";
                cyan    = "#abe1a2";
                white   = "#ffedbe";
            };
        };
    };
}
