{ ... }:

{
  imports = [
    ./config/aliases.nix # Shell aliases
    ./config/init.nix # Extra shell config
    ./config/integrations.nix # Shell integrations
    ./config/history.nix # History config
    ./config/plugins.nix # Plugin config
  ];

  # Base zsh configuration
  programs.zsh = {
    enable = true;
    defaultKeymap = "emacs"; # Emacs binds
    enableCompletion = false; # Auto-completions
    autosuggestion = {
      enable = true;
      strategy = [
        "history"
        "completion"
      ];
    };
  };
}
