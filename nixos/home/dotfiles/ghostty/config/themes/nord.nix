{ ... }:

{
    programs.ghostty = {
        settings = {
            theme = "nord";
        };

        themes = {
            nord = {
                background = "2E3440";
                foreground = "D8DEE9";

                palette = [
                    "0=3B4252"  # black
                    "1=BF616A"  # red
                    "2=A3BE8C"  # green
                    "3=EBCB8B"  # yellow
                    "4=81A1C1"  # blue
                    "5=B48EAD"  # magenta
                    "6=88C0D0"  # cyan
                    "7=E5E9F0"  # white
                    "8=4C566A"  # bright black
                    "9=BF616A"  # bright red
                    "10=A3BE8C" # bright green
                    "11=EBCB8B" # bright yellow
                    "12=81A1C1" # bright blue
                    "13=B48EAD" # bright magenta
                    "14=8FBCBB" # bright cyan
                    "15=ECEFF4" # bright white
                ];
            };
        };
    };
}
