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
      };
    };
  };
}
