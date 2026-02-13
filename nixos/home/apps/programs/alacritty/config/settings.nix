{ ... }:

{
    programs.alacritty = {
        # Config / alacritty.toml
        settings = {
            # Fonts' config
            font.size = 13.5;

            # Environment variables
            env.TERM = "xterm-256color";
        };
    };
}
