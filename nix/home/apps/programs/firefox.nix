{ config, ... }:

{
  programs.librewolf = {
    enable = true;
    profiles.${config.home.username} = {
      settings = {
        # Override impractical defaults
        "privacy.clearOnShutdown.cookies" = true;
        "privacy.resistFingerprinting" = false;
        "privacy.sanitize.sanitizeOnShutdown" = false;
        "places.history.enabled" = false;

        # Dark mode
        "privacy.fingerprintingProtection" = true;
        "privacy.fingerprintingProtection.overrides" = "+AllTargets,-CSSPrefersColorScheme";
        "layout.css.prefers-color-scheme.content-override" = 0;

        # userChrome.css support
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      };
      userChrome = ''
        .tabbrowser-tab:not([selected]) .tab-close-button {
          display: none !important;
        }

        .tabbrowser-tab:not([selected]):hover .tab-close-button {
          display: flex !important;
        }
      '';
    };
  };
}
