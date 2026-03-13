{ ... }:

{
    programs.foot.settings = {
        main = {
            font = "monospace:size=13.5";
            resize-by-cells = "no";
            resize-delay-ms = "500";
            term = "xterm-256color";
            # dpi-aware = "yes";
        };
    };
}
