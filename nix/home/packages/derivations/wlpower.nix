{
  pkgs ? import <nixpkgs> { },
}:

pkgs.writeShellApplication {
  name = "wlpower";

  runtimeInputs = with pkgs; [
    coreutils
    gnugrep
    gawk
    util-linux
    upower
    wlr-randr
    brightnessctl
    dash # still needed for shebang if you want dash explicitly
  ];

  text = ''
    # wlpower : power-saver for wlroots compositors

    set -euo pipefail

    # re-exec in background once
    if [[ -z "''${_PWR:-}" ]]; then
      _PWR=1 setsid "$0" "$@" </dev/null >>/tmp/wlr-power.log 2>&1 &
      exit 0
    fi

    LOG=/tmp/wlr-power.log

    log()  { printf '[%s] %s\n'       "$(date '+%F %T')" "$*" >> "$LOG"; }
    warn() { printf '[%s] WARN  %s\n' "$(date '+%F %T')" "$*" >> "$LOG"; }
    die()  { printf '[%s] FATAL %s\n' "$(date '+%F %T')" "$*" >> "$LOG"; exit 1; }

    [[ -n "''${WAYLAND_DISPLAY:-}" ]] || die "No Wayland display"

    BAT=$(upower -e 2>/dev/null | grep -m1 'BAT') \
      || die "No battery device found"

    MONS=$(wlr-randr 2>/dev/null \
      | awk '/^[^ ]/ && !/^(Modes|Transform|Position|Scale)/ { print $1 }') \
      || die "wlr-randr returned no output"

    [[ -n "$MONS" ]] || die "No monitors found"

    KBD=$(brightnessctl --list 2>/dev/null \
      | awk -F"'" '/kbd_backlight/{ print $2; exit }' || true)

    log "Started bat=$BAT monitors=$(echo "$MONS" | tr '\n' ' ') kbd=''${KBD:-none}"

    pick_mode() {
      local mon=$1 want=$2
      wlr-randr --output "$mon" 2>/dev/null \
        | awk -v want="$want" '
          /Modes:/,0 {
            if (!match($0, /([0-9]+)x([0-9]+) px, ([0-9.]+) Hz/, m)) next
            if (m[1]+0 > 1920 || m[2]+0 > 1200) next
            px = m[1]*m[2]; hz = m[3]+0; c = m[1]"x"m[2]"@"hz
            if (want == "max" && (px > bpx || (px == bpx && hz > bhz))) {
              bpx=px; bhz=hz; best=c
            }
            if (want != "max" && hz >= want-1 && hz <= want+1 && px >= bpx) {
              bpx=px; best=c
            }
          }
          END { print best }
        '
    }

    get_state() {
      upower -i "$BAT" 2>/dev/null | awk '/state:/{ print $2 }'
    }

    apply() {
      log "State → $1"

      local kbd_val mode_want

      case "$1" in
        discharging)
          kbd_val=0
          mode_want=60
          ;;
        *)
          kbd_val=100%
          mode_want=max
          ;;
      esac

      [[ -n "$KBD" ]] && brightnessctl -d "$KBD" set "$kbd_val" -q 2>/dev/null || true

      while IFS= read -r mon; do
        [[ -n "$mon" ]] || continue

        mode=$(pick_mode "$mon" "$mode_want")

        if [[ -z "$mode" ]]; then
          warn "No mode for '$1' on $mon – keeping current"
          continue
        fi

        log "Mode $mon → $mode"

        wlr-randr --output "$mon" --mode "$mode" --scale 1 2>/dev/null \
          || warn "wlr-randr failed to set '$mode' on $mon"
      done <<< "$MONS"
    }

    monitor_upower() {
      while true; do
        upower --monitor 2>/dev/null | while read -r _; do
          new=$(get_state)

          if [[ -z "$new" || "$new" == "$state" ]]; then
            continue
          fi

          state=$new
          apply "$state"
        done

        warn "upower --monitor exited, restarting in 5s"
        sleep 5
      done
    }

    state=$(get_state)
    [[ -n "$state" ]] || die "Could not read battery state"

    apply "$state"
    monitor_upower
  '';
}
