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
      };
    };
  };
}
