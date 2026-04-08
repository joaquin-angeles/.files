#!/usr/bin/env dash

trap 'pkill wayfreeze 2>/dev/null' EXIT
wayfreeze &
sleep 0.1
grim -g "$(slurp -d)" - | wl-copy --type image/png
