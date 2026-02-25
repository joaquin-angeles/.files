{ ... }:

{
    programs.alacritty.settings = {
        font.size = 13.5; # Fonts' config
        env.TERM = "xterm-256color"; # Environment variables
        scrolling.history = 1000; # Scrollback
    };
}
