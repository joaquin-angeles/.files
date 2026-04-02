{ config, pkgs, ... }:

{
  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    GTK_DECORATION_LAYOUT = ":";
    GIO_EXTRA_MODULES = "${pkgs.gvfs}/lib/gio/modules";
    NIXOS_OZONE_WL = "1";
    MANPAGER = "bat -l man --style=plain";
    RUSTUP_HOME = "${config.home.homeDirectory}/.local/share/rustup";
    WLR_NO_HARDWARE_CURSORS = "1";
  };

  home.sessionPath = [
    "${config.home.homeDirectory}/.local/bin"
    "${config.home.homeDirectory}/.cargo/bin"
    "${pkgs.stdenv.cc}/bin"
  ];
}
