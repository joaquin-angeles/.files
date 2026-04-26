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
              ${pkgs.git}/bin/git -C "$dest" pull --ff-only || die "Failed to update $dest"
          else
              log "Cloning $(${pkgs.coreutils}/bin/basename "$dest")..."
              ${pkgs.git}/bin/git clone "$@" "$url" "$dest" || die "Failed to clone $url"
          fi
      }

      clone_or_update \
          "https://github.com/sachnr/gruvbox-kvantum-themes.git" \
          "$GRUVBOX_REPO" \
          --depth=1

      THEME_DEST="''${KVANTUM_DIR}/''${THEME_NAME}"
      if [ ! -L "$THEME_DEST" ] || [ ! -e "$THEME_DEST" ]; then
          log "Linking ''${THEME_NAME}..."
          ${pkgs.coreutils}/bin/ln -sfn "''${GRUVBOX_REPO}/''${THEME_NAME}" "$KVANTUM_DIR/"
      else
          log "Symlink already exists for ''${THEME_NAME}, skipping..."
      fi

      log "Applying ''${THEME_NAME}..."
      cat > "''${KVANTUM_DIR}/kvantum.kvconfig" <<EOF
      [General]
      theme=''${THEME_NAME}
      EOF

      log "Gruvbox-Dark-Blue Kvantum theme setup complete!"
    '';
  };
in
{
  qt = {
    enable = true;
    platformTheme.name = "qtct";
    style.name = "kvantum-dark";
  };

  systemd.user.services.gruvbox-kvantum = {
    Unit = {
      Description = "Install and configure Gruvbox Kvantum theme";
      After = [ "network-online.target" ];
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
