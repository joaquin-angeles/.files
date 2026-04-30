{ ... }:

{
  programs.librewolf = {
    enable = true;
    profiles.default = {
      settings = {
        # Override impractical defaults (RFP → FFP for dark theme support)
        "privacy.fingerprintingProtection" = true;
        "privacy.resistFingerprinting" = false;

        # Selective sanitizing override
        "privacy.clearOnShutdown.cache" = false;

        # Preferences
        "places.history.enabled" = false;
        "browser.tabs.loadInBackground" = true;
        "browser.backspace_action" = 0;

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
