{...}: {
  # Auto CPU frequency
  services.auto-cpufreq = {
    enable = true;
    settings = {
      battery = {
        governor = "powersave";
        turbo = "never";
      };
      charger = {
        governor = "performance";
        turbo = "auto";
      };
    };
  };

  services.power-profiles-daemon.enable = false; # Disable PPD

  services.upower.enable = true; # Upower
}
