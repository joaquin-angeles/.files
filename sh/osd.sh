#!/usr/bin/env dash
# osd.sh — minimal volume/brightness notifier for mako

# Config
volume_step=5
brightness_step=5
max_volume=100
notification_timeout=2000

get_volume() {
    wpctl get-volume @DEFAULT_AUDIO_SINK@ \
    | awk '{printf "%d", $2 * 100}'
}

get_mute() {
    wpctl get-volume @DEFAULT_AUDIO_SINK@ \
    | grep -q '\[MUTED\]' && echo yes || echo no
}

get_brightness() {
    brightnessctl -m | awk -F, '{gsub(/%/,"",$4); print $4}'
}

make_bar() {
    _val="$1"
    _len=10
    _filled=$(( _val * _len / 100 ))
    _empty=$(( _len - _filled ))
    _bar="" _i=0
    while [ $_i -lt $_filled ]; do _bar="${_bar}▬"; _i=$(( _i + 1 )); done
    _dim=""
    while [ $_i -lt $_len ]; do _dim="${_dim}▬"; _i=$(( _i + 1 )); done
    echo "${_bar}<span foreground='#56595a'>${_dim}</span>"
}

show_volume_notif() {
    vol=$(get_volume)
    bar=$(make_bar "$vol")

    if [ "$(get_mute)" = "yes" ]; then
        icon="󰖁"
    elif [ "$vol" -eq 0 ]; then
        icon="󰝟"
    elif [ "$vol" -lt 50 ]; then
        icon="󰖀"
    else
        icon="󰕾"
    fi

    notify-send \
    --app-name="osd" \
    --urgency=low \
    --expire-time="$notification_timeout" \
    --hint=int:x-mako-width:225 \
    --hint=string:x-canonical-private-synchronous:osd-volume \
    "      $icon   Volume" "${bar}  ${vol}%"
}

show_brightness_notif() {
    bri=$(get_brightness)
    bar=$(make_bar "$bri")

    notify-send \
    --app-name="osd" \
    --urgency=low \
    --expire-time="$notification_timeout" \
    --hint=string:x-canonical-private-synchronous:osd-brightness \
    "     󰃠   Brightness" "${bar}  ${bri}%"
}

case "$1" in
    volume_up)
        vol=$(get_volume)
        if [ $(( vol + volume_step )) -gt "$max_volume" ]; then
            wpctl set-volume @DEFAULT_AUDIO_SINK@ "${max_volume}%"
        else
            wpctl set-volume @DEFAULT_AUDIO_SINK@ "${volume_step}%+"
        fi
        wpctl set-mute @DEFAULT_AUDIO_SINK@ 0
        show_volume_notif
        ;;
    volume_down)
        wpctl set-volume @DEFAULT_AUDIO_SINK@ "${volume_step}%-"
        show_volume_notif
        ;;
    volume_mute)
        wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
        show_volume_notif
        ;;
    brightness_up)
        brightnessctl set "${brightness_step}%+"
        show_brightness_notif
        ;;
    brightness_down)
        brightnessctl set "${brightness_step}%-"
        show_brightness_notif
        ;;
    *)
        echo "Usage: $0 <volume_up|volume_down|volume_mute|brightness_up|brightness_down>"
        exit 1
        ;;
esac
