{ ... }:

{
    programs.ghostty = {
        settings = {
            theme = "tokyo_night";
        };

        themes = {
            tokyo_night = {
                background = "1a1b26";
                foreground = "a9b1d6";

                palette = [
                    "0=32344a"  # black
                    "1=f7768e"  # red
                    "2=9ece6a"  # green
                    "3=e0af68"  # yellow
                    "4=7aa2f7"  # blue
                    "5=ad8ee6"  # magenta
                    "6=449dab"  # cyan
                    "7=787c99"  # white
                    "8=444b6a"  # bright black
                    "9=ff7a93"  # bright red
                    "10=b9f27c" # bright green
                    "11=ff9e64" # bright yellow
                    "12=7da6ff" # bright blue
                    "13=bb9af7" # bright magenta
                    "14=0db9d7" # bright cyan
                    "15=acb0d0" # bright white
                ];
            };
        };
    };
}
