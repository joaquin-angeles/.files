#!/usr/bin/env bash
set -euo pipefail
[[ -n "${_POWER_SAVER_DAEMON:-}" ]] || {
    _POWER_SAVER_DAEMON=1 setsid "$0" "$@" & exit 0
}

# Lock
LOCK=/tmp/power-saver.lock
exec 9>"$LOCK"
flock -n 9 || { echo "Already running." >&2; exit 1; }
echo $$ >"$LOCK"

# Logging
LOG=/tmp/power-saver.log
log() { printf '[%(%F %T)T] %s\n' -1 "$*" | tee -a "$LOG" >&2; }

# Sanity
[[ -n "${WAYLAND_DISPLAY:-}" ]] || { log "No Wayland session"; exit 1; }

BAT=$(upower -e | grep -m1 BAT) || { log "No battery"; exit 1; }
KBD=$(brightnessctl --list | awk -F"'" '/kbd_backlight/{print $2; exit}')
MON=$(wlr-randr | awk 'NR==1{print $1}')

log "Started | BAT=$BAT MON=$MON KBD=${KBD:-none}"

# Helpers
get_modes() {
    wlr-randr --output "$MON" |
    sed -n '/Modes:/,$p' |
    grep -oP '\d+x\d+ px, [\d.]+ Hz'
}

pick_mode() {
    local want="$1"
    get_modes | awk -v want="$want" '
    match($0,/([0-9]+)x([0-9]+).* ([0-9.]+) Hz/,m){
    px=m[1]*m[2]; hz=m[3]
    if (want=="max") print px, hz, $0
    else if (hz>=59 && hz<61) print 0, hz, $0
    }' |
    sort -k1,1nr -k2,2nr |
    head -n1 |
    cut -d' ' -f3-
}

set_mode() {
    local line="$1"
    [[ -z "$line" ]] && { log "No mode found"; return; }

    local mode=${line/ px, /@}
    mode=${mode/ Hz/}

    log "Setting mode: $mode"
    wlr-randr --output "$MON" --mode "$mode" --scale 1 || \
    log "Failed: $mode"
}

apply() {
    local state="$1"
    log "State: $state"

    if [[ "$state" == discharging ]]; then
        [[ -n "$KBD" ]] && brightnessctl -d "$KBD" set 0
        set_mode "$(pick_mode 60)"
    else
        [[ -n "$KBD" ]] && brightnessctl -d "$KBD" set 100%
        set_mode "$(pick_mode max)"
    fi
}

trap 'rm -f "$LOCK"' EXIT

# Monitor loop
state=$(upower -i "$BAT" | awk '/state:/{print $2}')
apply "$state"

upower --monitor |
grep --line-buffered "$BAT" |
while read -r _; do
    new=$(upower -i "$BAT" | awk '/state:/{print $2}')
    [[ "$new" != "$state" ]] && state="$new" && apply "$state"
done
