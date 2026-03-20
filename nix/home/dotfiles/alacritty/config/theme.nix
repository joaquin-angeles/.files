{ ... }:
{
  imports = [
    ./themes/gruvbox_dark.nix
  ];

  programs.alacritty.settings = {
    # Window padding
    window = {
      opacity = 0.8; # Transparency
      padding = {
        x = 10;
        y = 10;
      };
      dynamic_padding = true;
    };
  };
}
