{ ... }:

{
  programs.librewolf = {
    enable = true;
    profiles.default = {
      settings = {
        # Override impractical defaults
        "privacy.fingerprintingProtection" = true; # FFP over RFP for dark themes
        "privacy.resistFingerprinting" = false;

        # Balanced privacy
        "privacy.sanitize.sanitizeOnShutdown" = true;
        "privacy.clearOnShutdown.cookies" = true;
        "places.history.enabled" = true;

        # General settings
        "browser.compactmode.show" = true;
        "browser.urlbar.openintab" = true;

        # Dark mode
        "privacy.fingerprintingProtection.overrides" = "+AllTargets,-CSSPrefersColorScheme,-TimezoneOffset";
        "layout.css.prefers-color-scheme.content-override" = 0;

        # userChrome.css support
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      };

      # UI overrides
      userChrome = ''
        .tabbrowser-tab .tab-close-button {
          display: none;
        }

        .tabbrowser-tab:hover .tab-close-button {
          display: block;
        }
      '';
    };
  };
}
