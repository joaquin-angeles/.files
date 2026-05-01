{ ... }:

{
  programs.zellij.settings = {
    theme = "ansi";
    default_layout = "compact";
    on_force_close = "quit"; # Standard quit
    show_startup_tips = false; # Disable the obstruction
    default_mode = "locked"; # Default to insert
  };
}
