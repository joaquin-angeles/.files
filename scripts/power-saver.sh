#!/usr/bin/env bash

# Lock: held by the *background* process, not the parent 
LOCKFILE=/tmp/power-saver.lock

# Re-exec ourselves in the background if we're not already daemonized
if [[ -z "$_POWER_SAVER_DAEMON" ]]; then
    _POWER_SAVER_DAEMON=1 setsid "$0" "$@" &
    exit 0
fi

exec 9>"$LOCKFILE"
if ! flock -n 9; then
    echo "power-saver is already running." >&2
    exit 1
fi

# Store PID and PGID so cleanup can kill the whole process group
echo $$ > "$LOCKFILE"
PGID=$(ps -o pgid= -p $$ | tr -d ' ')

# Logging 
LOG=/tmp/power-saver.log
log() { echo "[$(date '+%F %T')] $*" | tee -a "$LOG" >&2; }

# Sanity checks 
if [[ -z "$HYPRLAND_INSTANCE_SIGNATURE" ]]; then
    log "Hyprland is not running. Exiting."
    exit 1
fi

BATTERY_DEVICE=$(upower -e | grep -m1 'BAT')
if [[ -z "$BATTERY_DEVICE" ]]; then
    log "Battery device not found. Is upower enabled?"
    exit 1
fi

KBD_DEVICE=$(brightnessctl --list | awk -F"'" '/kbd_backlight/{print $2; exit}')
MONITOR=$(hyprctl monitors | awk '/Monitor/{print $2; exit}')

log "Started. Battery: $BATTERY_DEVICE | Monitor: $MONITOR | KBD: $KBD_DEVICE"

# Power state application 
apply_state() {
    local state=$1
    log "Applying state: $state"

    if [[ "$state" == "discharging" ]]; then
        [[ -n "$KBD_DEVICE" ]] && brightnessctl --device="$KBD_DEVICE" set 0
        hyprctl keyword monitor "$MONITOR,1920x1080@60,auto,1.0"
        hyprctl keyword animations:enabled 0
        hyprctl keyword decoration:blur:enabled 0
        hyprctl keyword decoration:shadow:enabled 0
    else
        [[ -n "$KBD_DEVICE" ]] && brightnessctl --device="$KBD_DEVICE" set 100%
        hyprctl keyword monitor "$MONITOR,1920x1080@120,auto,1.0"
        hyprctl keyword animations:enabled 1
        hyprctl keyword decoration:blur:enabled 1
        hyprctl keyword decoration:shadow:enabled 1
    fi
}

# Cleanup on exit 
cleanup() {
    log "Shutting down (PGID $PGID)."
    flock -u 9
    rm -f "$LOCKFILE"
    # Kill every process in our session group (upower, grep, etc.)
    kill -- -"$PGID" 2>/dev/null
}
trap cleanup EXIT INT TERM

# Apply initial state immediately on startup 
current_state=$(upower -i "$BATTERY_DEVICE" | awk '/state:/{print $2; exit}')
apply_state "$current_state"

# Monitor loop (no subshell: use substitution instead of pipe) 
while read -r _; do
    new_state=$(upower -i "$BATTERY_DEVICE" | awk '/state:/{print $2; exit}')
    if [[ "$new_state" != "$current_state" ]]; then
        current_state="$new_state"
        apply_state "$current_state"
    fi
done < <(upower --monitor | grep --line-buffered "$BATTERY_DEVICE")
