{ config, ... }:

{
  programs.librewolf = {
    enable = true;
    profiles.${config.home.username} = {
      settings = {
        # Override impractical defaults
        "privacy.resistFingerprinting" = false;
        "privacy.sanitize.sanitizeOnShutdown" = false;
        "privacy.clearOnShutdown.cookies" = false;

        # Dark mode
        "privacy.fingerprintingProtection" = true;
        "privacy.fingerprintingProtection.overrides" = "+AllTargets,-CSSPrefersColorScheme";
        "layout.css.prefers-color-scheme.content-override" = 0;

        # userChrome.css support
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      };
      userChrome = ''
        .titlebar-buttonbox-container {
          display: none;
        }

        .tabbrowser-tab {
          flex-grow: 1 !important;
        }

        #back-button,
        #forward-button,
        #reload-button,
        #stop-button {
          display: none !important;
        }

        #nav-bar {
          position: absolute !important;
          width: 100% !important;
          height: 100% !important;
          top: -100% !important;
        }

        #nav-bar:focus-within {
          top: 0% !important;
        }
      '';
    };
  };
}
