{ ... }:

{
    programs.ghostty = {
        settings = {
            theme = "gruvbox_dark";
        };

        themes = {
            gruvbox_dark = {
                background = "1d2021";
                foreground = "d4be98";

                palette = [
                    "0=1d2021"  # black
                    "1=ea6962"  # red
                    "2=a9b665"  # green
                    "3=d8a657"  # yellow
                    "4=7daea3"  # blue
                    "5=d3869b"  # magenta
                    "6=89b482"  # cyan
                    "7=d4be98"  # white
                    "8=404344"  # bright black
                    "9=ff837a"  # bright red
                    "10=d3e37e" # bright green
                    "11=ffcf6c" # bright yellow
                    "12=9cd9cb" # bright blue
                    "13=ffa7c1" # bright magenta
                    "14=abe1a2" # bright cyan
                    "15=ffedbe" # bright white
                ];
            };
        };
    };
}
