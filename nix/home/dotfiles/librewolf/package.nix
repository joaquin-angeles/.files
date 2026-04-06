{ ... }:

{
  programs.librewolf = {
    enable = true;
    profiles.joaquin = {
      settings = {
        # Mozilla account support
        "identity.fxaccounts.enabled" = true;

        # Password sync
        "services.sync.engine.passwords" = true;
        "signon.rememberSignons" = true;

        # Add-on sync
        "services.sync.engine.addons" = true;
        "extensions.autoDisableScopes" = 0;

        # Media playback
        "media.eme.enabled" = true;

        # Disable impractical defaults
        "privacy.resistFingerprinting" = false;
        "privacy.sanitize.sanitizeOnShutdown" = false;
        "privacy.clearOnShutdown.history" = false;
        "privacy.clearOnShutdown.sessions" = false;

        # Styling components
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "svg.context-properties.content.enabled" = true;
        "sidebar.animation.enabled" = false;
        "widget.gtk.rounded-bottom-corners.enabled" = true;

        # --- revert sidebar position to left ---
        "sidebar.position_start" = true;

        # --- general ---
        "parfait.animations.enabled" = true;
        "parfait.blur.enabled" = false;
        "parfait.window.borderless" = false;

        # --- background ---
        "parfait.bg.accent-color" = false;
        "parfait.bg.contrast" = 2;
        "parfait.bg.gradient" = false;
        "parfait.bg.opacity" = 4;
        "parfait.bg.transparent" = false;

        # --- tabs ---
        "parfait.tabs.groups.color" = false;

        # --- sidebar ---
        "parfait.sidebar.width.preset" = 2;

        # --- theme ---
        "parfait.theme.lwt.alt" = false;
        "parfait.theme.roundness.preset" = 1;

        # --- toolbar ---
        "parfait.toolbar.sidebar-gutter" = true;
        "parfait.toolbar.unified-sidebar" = true;
        "parfait.toolbar.force-hl-layout" = false;

        # --- traffic lights ---
        "parfait.traffic-lights.enabled" = false;
        "parfait.traffic-lights.mono" = false;

        # --- url bar ---
        "parfait.urlbar.url.center" = false;
        "parfait.urlbar.results.compact" = false;
        "parfait.urlbar.search-mode.glow" = true;

        # --- new tab ---
        "parfait.new-tab.logo" = 1;
        "parfait.new-tab.bg.pattern" = false;
      };
    };
  };

  home.file.".librewolf/joaquin/chrome".source = ./theme;
}
