{ config, pkgs, ... }:

{
  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    GTK_DECORATION_LAYOUT = ":";
    GIO_EXTRA_MODULES = "${pkgs.gvfs}/lib/gio/modules";
    NIXOS_OZONE_WL = "1";
    MANPAGER = "bat -l man --style=plain";
    RUSTUP_HOME = "${config.xdg.dataHome}/rustup";
    WLR_NO_HARDWARE_CURSORS = "1";
    XDG_DATA_HOME = "${config.xdg.dataHome}";
    FZF_DEFAULT_OPTS = builtins.concatStringsSep " " [
      "--style=minimal"
      "--gutter=' '"
      "--color=bg:-1,fg:7,bg+:5,fg+:0,gutter:-1"
      "--color=hl:4,hl+:0"
      "--color=info:3,prompt:3"
      "--color=pointer:5,marker:2"
      "--color=spinner:6,header:4"
      "--color=query:7,separator:8,scrollbar:8"
      "--highlight-line"
    ];
  };

  home.sessionPath = [
    "$HOME/.local/bin"
    "$HOME/.cargo/bin"
    "${pkgs.stdenv.cc}/bin"
  ];
}
