{ pkgs, ... }:

let
  gruvbox-kvantum = pkgs.writeTextFile {
    name = "gruvbox-kvantum";
    executable = true;
    destination = "/bin/gruvbox-kvantum";

    text = ''
      #!${pkgs.dash}/bin/dash
      set -e

      KVANTUM_DIR="$HOME/.config/Kvantum"
      GRUVBOX_REPO="$HOME/.local/share/gruvbox-kvantum"
      THEME_NAME="Gruvbox-Dark-Blue"

      log() { echo "[$(${pkgs.coreutils}/bin/date +%T)] $*"; }
      die() { echo "ERROR: $*" >&2; exit 1; }

      ${pkgs.coreutils}/bin/mkdir -p "$KVANTUM_DIR"

      clone_or_update() {
          url="$1"
          dest="$2"
          shift 2
          if [ -d "$dest/.git" ]; then
              log "Updating $(${pkgs.coreutils}/bin/basename "$dest")..."
              ${pkgs.git}/bin/git -C "$dest" fetch --depth=1 origin \
                  || die "Failed to fetch $dest"
              ${pkgs.git}/bin/git -C "$dest" reset --hard origin/HEAD \
                  || die "Failed to reset $dest"
          else
              log "Cloning $(${pkgs.coreutils}/bin/basename "$dest")..."
              ${pkgs.git}/bin/git clone "$@" "$url" "$dest" \
                  || die "Failed to clone $url"
          fi
      }

      clone_or_update \
          "https://github.com/sachnr/gruvbox-kvantum-themes.git" \
          "$GRUVBOX_REPO" \
          --depth=1

      log "Linking ''${THEME_NAME}..."
      ${pkgs.coreutils}/bin/ln -sfn "''${GRUVBOX_REPO}/''${THEME_NAME}" "$KVANTUM_DIR/"

      log "Applying ''${THEME_NAME}..."
      printf '[General]\ntheme=%s\n' "''${THEME_NAME}" > "''${KVANTUM_DIR}/kvantum.kvconfig"

      log "Gruvbox-Dark-Blue Kvantum theme setup complete!"
    '';
  };
in
{
  home.packages = with pkgs; [
    kdePackages.qt6ct
    kdePackages.qtstyleplugin-kvantum
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct
  ];

  qt = {
    enable = true;
    platformTheme.name = "qtct";
    style.name = "kvantum-dark";
  };

  systemd.user.services.gruvbox-kvantum = {
    Unit = {
      Description = "Install and configure Gruvbox Kvantum theme";
      After = [ "network-online.target" ];
      Wants = [ "network-online.target" ];
    };

    Service = {
      Type = "oneshot";
      TimeoutStartSec = "15min";
      ExecStart = "${gruvbox-kvantum}/bin/gruvbox-kvantum";
    };
  };

  systemd.user.timers.gruvbox-kvantum = {
    Unit = {
      Description = "Update Gruvbox Kvantum theme every Saturday";
    };

    Timer = {
      OnCalendar = "Sat *-*-* 10:00:00";
      Persistent = true;
      RandomizedDelaySec = "30min";
    };

    Install = {
      WantedBy = [ "timers.target" ];
    };
  };
}
