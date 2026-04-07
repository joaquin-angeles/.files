{ ... }:

{
  programs.librewolf = {
    enable = true;
    profiles.joaquin = {
      settings = {
        # Media playback
        "media.eme.enabled" = true;

        # Disable impractical defaults
        "signon.rememberSignons" = true;
        "privacy.resistFingerprinting" = false;
      };
    };
  };
}
