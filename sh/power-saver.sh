#!/usr/bin/env bash
set -euo pipefail
if [[ -z "${_POWER_SAVER_DAEMON:-}" ]]; then
    _POWER_SAVER_DAEMON=1 setsid "$0" "$@" &
    exit 0
fi

# Process checking
LOCKFILE=/tmp/power-saver.lock
exec 9>"$LOCKFILE"
flock -n 9 || { echo "power-saver is already running." >&2; exit 1; }
echo $$ >"$LOCKFILE"
PGID=$(ps -o pgid= -p $$ | tr -d ' ')

# Logging
LOG=/tmp/power-saver.log
log() { echo "[$(date '+%F %T')] $*" | tee -a "$LOG" >&2; }

# Sanity checks
[[ -n "${WAYLAND_DISPLAY:-}" ]] || { log "No Wayland session. Exiting."; exit 1; }

BATTERY=$(upower -e | grep -m1 'BAT') || { log "No battery found."; exit 1; }
KBD=$(brightnessctl --list | awk -F"'" '/kbd_backlight/{print $2; exit}')
MONITOR=$(wlr-randr | grep -om1 '^[^ ]*')

log "Started. Battery: $BATTERY | Monitor: $MONITOR | KBD: $KBD"

# Mode detection
get_modes() {
    wlr-randr --output "$MONITOR" 2>/dev/null |
    sed -n '/Modes:/,$p' |
    grep -oP '\d+x\d+ px, [\d.]+ Hz'
}

mode_60() {
    get_modes | grep -E '60\.0{4,} Hz' | head -n1 ||
    get_modes | grep -E ', 60\.' | head -n1
}

mode_max() {
    get_modes |
    awk '
    {
        match($0, /([0-9]+)x([0-9]+).* ([0-9.]+) Hz/, m)
        if (m[1] && m[2] && m[3]) {
            pixels = m[1] * m[2]
            print pixels, m[3], $0
        }
    }' |
    sort -k1,1nr -k2,2nr |
    head -n1 |
    cut -d' ' -f3-
}

# Mode application
set_mode() {
    local mode_line="$1"
    local label="$2"

    if [[ -z "$mode_line" ]]; then
        log "Warning: no $label mode found, skipping"
        return
    fi

    # Extract just the "1920x1080@144.000000" part that wlr-randr accepts
    local mode_str
    mode_str=$(echo "$mode_line" | sed -E 's/ px, /@/' | sed -E 's/ Hz//')

    log "Setting $label: $mode_str"
    if ! wlr-randr --output "$MONITOR" --mode "$mode_str" --scale 1; then
        log "ERROR: Failed to set mode $mode_str"
    fi
}

apply_state() {
    local state=$1
    log "Applying state: $state"
    if [[ "$state" == "discharging" ]]; then
        [[ -n "$KBD" ]] && brightnessctl --device="$KBD" set 0
        set_mode "$(mode_60)" "60Hz"
    else
        [[ -n "$KBD" ]] && brightnessctl --device="$KBD" set 100%
        set_mode "$(mode_max)" "max refresh"
    fi
}

# Cleanup
cleanup() {
    log "Shutting down (PGID $PGID)."
    flock -u 9; rm -f "$LOCKFILE"
    kill -- -"$PGID" 2>/dev/null
}
trap cleanup EXIT INT TERM

# Run script
current_state=$(upower -i "$BATTERY" | awk '/state:/{print $2; exit}')
apply_state "$current_state"

while read -r _; do
    new_state=$(upower -i "$BATTERY" | awk '/state:/{print $2; exit}')
    if [[ "$new_state" != "$current_state" ]]; then
        current_state="$new_state"
        apply_state "$current_state"
    fi
done < <(upower --monitor | grep --line-buffered "$BATTERY")
