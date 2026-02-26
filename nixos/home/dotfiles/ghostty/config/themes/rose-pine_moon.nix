{ ... }:

{
    programs.ghostty = {
        settings = {
            theme = "rose-pine-moon";
        };

        themes = {
            rose-pine-moon = {
                background = "232136";
                foreground = "e0def4";

                palette = [
                    "0=393552"  # black
                    "1=eb6f92"  # red
                    "2=3e8fb0"  # green
                    "3=f6c177"  # yellow
                    "4=9ccfd8"  # blue
                    "5=c4a7e7"  # magenta
                    "6=ea9a97"  # cyan
                    "7=e0def4"  # white
                    "8=6e6a86"  # bright black
                    "9=eb6f92"  # bright red
                    "10=3e8fb0" # bright green
                    "11=f6c177" # bright yellow
                    "12=9ccfd8" # bright blue
                    "13=c4a7e7" # bright magenta
                    "14=ea9a97" # bright cyan
                    "15=e0def4" # bright white
                ];
            };
        };
    };
}
