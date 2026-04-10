{ config, ... }:

{
  programs.librewolf = {
    enable = true;
    profiles.${config.home.username} = {
      settings = {
        # Override impractical defaults
        "privacy.clearOnShutdown.cookies" = true;
        "privacy.resistFingerprinting" = false;
        "privacy.sanitize.sanitizeOnShutdown" = true;
        "places.history.enabled" = true;

        # General settings
        "browser.compactmode.show" = true;
        "browser.urlbar.openintab" = true;

        # Dark mode
        "privacy.fingerprintingProtection" = true;
        "privacy.fingerprintingProtection.overrides" = "+AllTargets,-CSSPrefersColorScheme";
        "layout.css.prefers-color-scheme.content-override" = 0;

        # userChrome.css support
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      };
      userChrome = ''
        .tabbrowser-tab .tab-close-button {
          display: none !important;
        }

        .tabbrowser-tab:hover .tab-close-button {
          display: flex !important;
        }
      '';
    };
  };
}
