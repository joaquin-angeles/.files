{
  pkgs ? import <nixpkgs> { },
}:

pkgs.writeTextFile {
  name = "wlpower";
  executable = true;
  destination = "/bin/wlpower";

  text = ''
    #!${pkgs.dash}/bin/dash
    # wlpower : power-saver for wlroots compositors
    set -eu

    [ -n "''${_PWR:-}" ] || { _PWR=1 ${pkgs.util-linux}/bin/setsid "$0" "$@" </dev/null >>/tmp/wlr-power.log 2>&1 & exit 0; }

    LOG=/tmp/wlr-power.log
    log()  { printf '[%s] %s\n'       "$(${pkgs.coreutils}/bin/date '+%F %T')" "$*" >> "$LOG"; }
    warn() { printf '[%s] WARN  %s\n' "$(${pkgs.coreutils}/bin/date '+%F %T')" "$*" >> "$LOG"; }
    die()  { printf '[%s] FATAL %s\n' "$(${pkgs.coreutils}/bin/date '+%F %T')" "$*" >> "$LOG"; exit 1; }

    [ -n "''${WAYLAND_DISPLAY:-}" ] || die "No Wayland display"

    BAT=$(${pkgs.upower}/bin/upower -e 2>/dev/null | ${pkgs.gnugrep}/bin/grep -m1 'BAT') || die "No battery device found"

    MONS=$(${pkgs.wlr-randr}/bin/wlr-randr 2>/dev/null | ${pkgs.gawk}/bin/awk '/^[^ ]/ && !/^(Modes|Transform|Position|Scale)/ { print $1 }') \
        || die "wlr-randr returned no output"
    [ -n "$MONS" ] || die "No monitors found"

    KBD=$(${pkgs.brightnessctl}/bin/brightnessctl --list 2>/dev/null | ${pkgs.gawk}/bin/awk -F"'" '/kbd_backlight/{ print $2; exit }' || true)

    log "Started  bat=$BAT  monitors=$(echo "$MONS" | ${pkgs.coreutils}/bin/tr '\n' ' ')  kbd=''${KBD:-none}"

    pick_mode() {
        mon=$1 want=$2
        ${pkgs.wlr-randr}/bin/wlr-randr --output "$mon" 2>/dev/null | ${pkgs.gawk}/bin/awk -v want="$want" '
            /Modes:/,0 {
                if (!match($0, /([0-9]+)x([0-9]+) px, ([0-9.]+) Hz/, m)) next
                if (m[1]+0 > 1920 || m[2]+0 > 1200) next
                px = m[1]*m[2]; hz = m[3]+0; c = m[1]"x"m[2]"@"hz
                if (want == "max" && (px > bpx || (px == bpx && hz > bhz))) { bpx=px; bhz=hz; best=c }
                if (want != "max" && hz >= want-1 && hz <= want+1 && px >= bpx)  { bpx=px; best=c }
            }
            END { print best }
        '
    }

    get_state() { ${pkgs.upower}/bin/upower -i "$BAT" 2>/dev/null | ${pkgs.gawk}/bin/awk '/state:/{ print $2 }'; }

    apply() {
        log "State → $1"
        case "$1" in
            discharging) kbd_val=0;    mode_want=60  ;;
            *)           kbd_val=100%; mode_want=max ;;
        esac

        [ -n "$KBD" ] && ${pkgs.brightnessctl}/bin/brightnessctl -d "$KBD" set "$kbd_val" -q 2>/dev/null || true

        echo "$MONS" | while IFS= read -r mon; do
            [ -n "$mon" ] || continue
            mode=$(pick_mode "$mon" "$mode_want")
            if [ -z "$mode" ]; then
                warn "No mode for '$1' on $mon – keeping current"
                continue
            fi
            log "Mode $mon → $mode"
            ${pkgs.wlr-randr}/bin/wlr-randr --output "$mon" --mode "$mode" --scale 1 2>/dev/null \
                || warn "wlr-randr failed to set '$mode' on $mon"
        done
    }

    monitor_upower() {
        while true; do
            ${pkgs.upower}/bin/upower --monitor 2>/dev/null | while IFS= read -r _; do
                new=$(get_state)
                [ -z "$new" ] || [ "$new" = "$state" ] && continue
                state=$new; apply "$state"
            done
            warn "upower --monitor exited, restarting in 5s"
            ${pkgs.coreutils}/bin/sleep 5
        done
    }

    state=$(get_state)
    [ -n "$state" ] || die "Could not read battery state"
    apply "$state"

    monitor_upower
  '';
}
