#!/usr/bin/env dash

trap 'pkill hyprpicker 2>/dev/null' EXIT

if command -v hyprpicker >/dev/null 2>&1; then
    hyprpicker -r -z &
    sleep 0.01
fi

geometry=$(slurp -d) || exit 1
grim -g "$geometry" - | wl-copy --type image/png
