#!/usr/bin/env dash

set -e

checkRunning() {
    sleep 1
    while true; do
        if [ "$(pgrep slurp | wc -m)" = "0" ]; then
            pkill hyprpicker 2>/dev/null
            exit
        fi
    done
}

begin_grab() {
    if command -v hyprpicker >/dev/null 2>&1; then
        hyprpicker -r -z &
        sleep 0.2
    fi

    geometry=$(slurp -d)
    grim -g "$geometry" - | wl-copy --type image/png
}

begin_grab & checkRunning
