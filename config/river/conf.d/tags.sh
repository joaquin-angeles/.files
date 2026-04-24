#!/usr/bin/env dash

i=1
while [ "$i" -le 9 ]; do
    tags=$(( 1 << (i - 1) ))
    # View/set windows for individual tags
    riverctl map normal "Super" "$i" set-focused-tags "$tags"
    riverctl map normal "Super+Shift" "$i" set-view-tags "$tags"

    # View/set windows for multiple tags
    riverctl map normal "Super+Control" "$i" toggle-focused-tags "$tags"
    riverctl map normal "Super+Shift+Control" "$i" toggle-view-tags "$tags"
    i=$(( i + 1 ))
done

# View/set windows for all tags
all_tags=$(( (1 << 32) - 1 ))
riverctl map normal "Super" 0 set-focused-tags "$all_tags"
riverctl map normal "Super+Shift" 0 spawn 'river-sticky'
