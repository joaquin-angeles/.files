{...}: {
  imports = [
    ./config/aliases.nix # Shell aliases
    ./config/binds.nix # Keybindings
    ./config/init.nix # Extra shell config
    ./config/integrations.nix # Shell integrations
    ./config/history.nix # History config
    ./config/plugins.nix # Plugin config
  ];

  # Base zsh configuration
  programs.zsh = {
    enable = true;
    completionInit = "autoload -Uz compinit && compinit -C";
    defaultKeymap = "emacs"; # Emacs binds
  };
}
