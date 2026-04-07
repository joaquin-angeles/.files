{ config, pkgs, ... }:

{
  programs.librewolf = {
    enable = true;
    package = pkgs.librewolf.overrideAttrs (old: {
      postInstall = (old.postInstall or "") + ''
        mkdir -p $out/lib/librewolf/defaults/pref
        echo 'pref("general.config.filename", "userChrome.js");
        pref("general.config.obscure_value", 0);' \
          > $out/lib/librewolf/defaults/pref/autoconfig.js

        cp ${./config/userChrome.js} $out/lib/librewolf/userChrome.js
      '';
    });
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
      userChrome = "${builtins.readFile ./config/userChrome.css}";
    };
  };
}
