{ ... }:

{
  programs.librewolf = {
    enable = true;
    profiles.default = {
      settings = {
        # Override impractical defaults
        "privacy.fingerprintingProtection" = true; # FFP over RFP for dark themes
        "privacy.resistFingerprinting" = false;
        "datareporting.healthreport.uploadEnabled" = false;
        "browser.crashReports.unsubmittedCheck.autoSubmit2" = false;

        # Privacy options
        "privacy.sanitize.sanitizeOnShutdown" = true;
        "privacy.clearOnShutdown.cookies" = true;
        "privacy.clearOnShutdown.cache" = false;
        "network.cookie.lifetimePolicy" = 2;
        "dom.security.https_only_mode" = true;
        "dom.security.https_only_mode_ever_enabled" = true;
        "network.dns.disablePrefetch" = true;
        "network.prefetch-next" = false;

        # Preferences
        "places.history.enabled" = false;
        "browser.aboutConfig.showWarning" = false;
        "browser.tabs.loadInBackground" = true;
        "browser.backspace_action" = 0;
        "browser.download.useDownloadDir" = false;
        "signon.rememberSignons" = false;

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
