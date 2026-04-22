#!/usr/bin/env dash

i=1
while [ "$i" -le 9 ]; do
    tags=$(( 1 << (i - 1) ))
    riverctl map normal "$mod" "$i" set-focused-tags "$tags"
    riverctl map normal "$mod+Shift" "$i" set-view-tags "$tags"
    i=$(( i + 1 ))
done

# View/set for all tags
all_tags=$(( (1 << 32) - 1 ))
riverctl map normal "$mod" 0 set-focused-tags "$all_tags"
riverctl map normal "$mod+Shift" 0 spawn 'river-sticky'
