{ config, pkgs, ... }:

{
    home.sessionVariables = {
        ANDROID_USER_HOME = "${config.home.homeDirectory}/.local/share/android";
        CARGO_HOME = "${config.home.homeDirectory}/.local/share/cargo";
        EDITOR = "nvim";
        PATH = "${config.home.homeDirectory}/.local/bin:${config.home.homeDirectory}/.cargo/bin:${pkgs.stdenv.cc}/bin:$PATH";
        VISUAL = "nvim";
        GTK_DECORATION_LAYOUT = ":";
        GIO_EXTRA_MODULES = "${pkgs.gvfs}/lib/gio/modules";
        _JAVA_OPTIONS = "-Djava.util.prefs.userRoot=${config.home.homeDirectory}/.config/java";
        NIXOS_OZONE_WL = "1";
        NIXPKGS_ALLOW_UNFREE = "1";
        NPM_CONFIG_USERCONFIG = "${config.home.homeDirectory}/.config/npm/npmrc";
        MANPAGER = "bat --style=plain -l man";
        RUSTUP_HOME = "${config.home.homeDirectory}/.local/share/rustup";
        WGETRC = "${config.home.homeDirectory}/.config/wgetrc";
        WLR_NO_HARDWARE_URSORS = "1";
        ZDOTDIR = "${config.home.homeDirectory}/.zsh";
    };
    home.file.".config/wgetrc".text = "hsts-file = ${config.home.homeDirectory}/.cache/wget-hsts";

    # Default applications
    xdg.enable = true;
    xdg.mimeApps = {
        enable = true;
        defaultApplications = {
            "text/html" = "app.zen_browser.zen.desktop";
            "x-scheme-handler/http" = "app.zen_browser.zen.desktop";
            "x-scheme-handler/https" = "app.zen_browser.zen.desktop";
            "x-scheme-handler/about" = "app.zen_browser.zen.desktop";
            "x-scheme-handler/unknown" = "app.zen_browser.zen.desktop";

            "text/plain" = "nvim.desktop";
            "text/markdown" = "nvim.desktop";
            "application/json" = "nvim.desktop";
            "application/x-yaml" = "nvim.desktop";
            "application/x-shellscript" = "nvim.desktop";
            "text/x-rust" = "nvim.desktop";
            "text/x-csrc" = "nvim.desktop";
            "text/x-chdr" = "nvim.desktop";
            "text/x-c++" = "nvim.desktop";
            "text/x-c++hdr" = "nvim.desktop";
            "text/x-python" = "nvim.desktop";
            "text/x-java" = "nvim.desktop";
            "text/x-go" = "nvim.desktop";
            "text/x-kotlin" = "nvim.desktop";
            "text/x-php" = "nvim.desktop";
            "text/x-ruby" = "nvim.desktop";
            "text/x-sql" = "nvim.desktop";

            "application/zip" = "org.gnome.FileRoller.desktop";
            "application/x-tar" = "org.gnome.FileRoller.desktop";
            "application/x-bzip2" = "org.gnome.FileRoller.desktop";
            "application/x-xz" = "org.gnome.FileRoller.desktop";
            "application/gzip" = "org.gnome.FileRoller.desktop";
            "application/x-7z-compressed" = "org.gnome.FileRoller.desktop";
            "application/x-rar" = "org.gnome.FileRoller.desktop";

            "inode/directory" = "org.gnome.Nautilus.desktop";
            "x-directory/normal" = "org.gnome.Nautilus.desktop";
        };
    };
}
