{ pkgs, ... }:

let
  gruvbox-papirus = pkgs.writeTextFile {
    name = "gruvbox-papirus";
    executable = true;
    destination = "/bin/gruvbox-papirus";

    text = ''
      #!${pkgs.dash}/bin/dash
      set -e

      ICONS_DIR="$HOME/.local/share/icons"
      PAPIRUS_REPO="$HOME/.local/share/papirus-icon-theme"
      GRUVBOX_REPO="$HOME/.local/share/papirus-folders"

      log() { echo "[$(${pkgs.coreutils}/bin/date +%T)] $*"; }
      die() { echo "ERROR: $*" >&2; exit 1; }

      ${pkgs.coreutils}/bin/mkdir -p "$ICONS_DIR"

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
          "https://github.com/PapirusDevelopmentTeam/papirus-icon-theme.git" \
          "$PAPIRUS_REPO" \
          --depth=1

      clone_or_update \
          "https://github.com/xelser/gruvbox-papirus-folders.git" \
          "$GRUVBOX_REPO"

      log "Checking Papirus icon theme symlinks..."
      for src in "''${PAPIRUS_REPO}"/Papirus*/; do
          dest="''${ICONS_DIR}/$(${pkgs.coreutils}/bin/basename "$src")"
          if [ ! -L "$dest" ]; then
              log "Linking $(${pkgs.coreutils}/bin/basename "$src")..."
              ${pkgs.coreutils}/bin/ln -sfn "$src" "$dest"
          else
              log "Symlink already exists for $(${pkgs.coreutils}/bin/basename "$src"), skipping..."
          fi
      done

      log "Installing Gruvbox folder icons..."
      ${pkgs.coreutils}/bin/cp -r "''${GRUVBOX_REPO}/src/"* "''${ICONS_DIR}/Papirus/"

      log "Applying Gruvbox Material Yellow..."
      "''${GRUVBOX_REPO}/papirus-folders" -C gruvbox-material-yellow --theme Papirus-Dark

      log "Gruvbox Papirus Folders setup complete!"
    '';
  };
in
{
  systemd.user.services.gruvbox-papirus = {
    Unit = {
      Description = "Install and configure Gruvbox Papirus icon theme";
      After = [ "network-online.target" ];
    };

    Service = {
      Type = "oneshot";
      TimeoutStartSec = "5min";
      ExecStart = "${gruvbox-papirus}/bin/gruvbox-papirus";
    };
  };

  systemd.user.timers.gruvbox-papirus = {
    Unit = {
      Description = "Update Gruvbox Papirus icon theme every Saturday";
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

  gtk.iconTheme = {
    name = "Papirus-Dark";
    package = null;
  };
}
