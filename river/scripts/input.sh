#!/usr/bin/env dash

LOG=/tmp/input-config.log
log() { printf '[%s] %s\n' "$(date '+%F %T')" "$*" | tee -a "$LOG" >&2; }

apply() {
    riverctl list-inputs 2>/dev/null | while IFS= read -r dev; do
        case "$dev" in
            *[Tt]ouchpad*)
                riverctl input "$dev" accel-profile adaptive
                riverctl input "$dev" pointer-accel 0.3
                riverctl input "$dev" natural-scroll enabled
                ;;
            *)  riverctl input "$dev" accel-profile flat ;;
        esac
    done
    log "Applied"
}

log "Started" && apply

udevadm monitor --udev --subsystem-match=usb 2>/dev/null |
grep --line-buffered "add\|remove" |
while IFS= read -r _; do sleep 0.5 && apply; done
