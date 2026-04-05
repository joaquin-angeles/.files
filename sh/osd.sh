#!/usr/bin/env dash

# Variables
volume_step=5
brightness_step=5
max_volume=100
notification_timeout=2000
download_album_art=true
show_album_art=true
show_music_in_volume_indicator=true

# Functions
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

get_volume_icon() {
    _vol=$(get_volume)
    _mute=$(get_mute)
    if [ "$_mute" = "yes" ] || [ "$_vol" -eq 0 ]; then
        volume_icon="󰝟"
    elif [ "$_vol" -lt 50 ]; then
        volume_icon="󰖀"
    else
        volume_icon="󰕾"
    fi
}

get_brightness_icon() {
    brightness_icon="󰃞"
}

make_bar() {
    _val="$1"
    _max="${2:-100}"
    _len=10
    _filled=$(( _val * _len / _max ))
    _bar="" _i=0
    while [ $_i -lt $_filled ]; do _bar="${_bar}█"; _i=$(( _i + 1 )); done
    while [ $_i -lt $_len ];    do _bar="${_bar}░"; _i=$(( _i + 1 )); done
    echo "$_bar"
}

get_album_art() {
    album_art=""
    command -v playerctl >/dev/null 2>&1 || return

    _url=$(playerctl metadata mpris:artUrl 2>/dev/null)
    [ -z "$_url" ] && return

    case "$_url" in
        file://*)
            album_art="${_url#file://}"
            ;;
        http://*|https://*)
            if [ "$download_album_art" = "true" ]; then
                _filename="/tmp/$(basename "$_url")"
                [ -f "$_filename" ] || curl -sL -o "$_filename" "$_url"
                album_art="$_filename"
            fi
            ;;
    esac
}

# Notifications
show_volume_notif() {
    vol=$(get_volume)
    get_volume_icon
    bar=$(make_bar "$vol")
    art_arg=""

    if [ "$show_music_in_volume_indicator" = "true" ] && command -v playerctl >/dev/null 2>&1; then
        song=$(playerctl metadata --format "{{title}} — {{artist}}" 2>/dev/null)
        if [ -n "$song" ]; then
            body=$(printf "%s  %s%%\n%s" "$bar" "$vol" "$song")
        else
            body=$(printf "%s  %s%%" "$bar" "$vol")
        fi

        if [ "$show_album_art" = "true" ]; then
            get_album_art
            [ -n "$album_art" ] && art_arg="--icon=$album_art"
        fi
    else
        body=$(printf "%s  %s%%" "$bar" "$vol")
    fi

    notify-send \
        --app-name="osd" \
        --urgency=low \
        --expire-time="$notification_timeout" \
        --hint=string:x-canonical-private-synchronous:osd-volume \
        ${art_arg:+"$art_arg"} \
        "${volume_icon} Volume" "$body"
}

show_brightness_notif() {
    bri=$(get_brightness)
    get_brightness_icon
    bar=$(make_bar "$bri")

    notify-send \
        --app-name="osd" \
        --urgency=low \
        --expire-time="$notification_timeout" \
        --hint=string:x-canonical-private-synchronous:osd-brightness \
        "${brightness_icon} Brightness" "${bar}  ${bri}%"
}

show_music_notif() {
    command -v playerctl >/dev/null 2>&1 || return

    title=$(playerctl metadata title 2>/dev/null)
    artist=$(playerctl metadata artist 2>/dev/null)
    album=$(playerctl metadata album 2>/dev/null)
    art_arg=""

    [ -z "$title" ] && return

    if [ "$show_album_art" = "true" ]; then
        get_album_art
        [ -n "$album_art" ] && art_arg="--icon=$album_art"
    fi

    if [ -n "$artist" ] && [ -n "$album" ]; then
        body="$artist — $album"
    elif [ -n "$artist" ]; then
        body="$artist"
    else
        body=""
    fi

    notify-send \
        --app-name="osd" \
        --urgency=low \
        --expire-time="$notification_timeout" \
        --hint=string:x-canonical-private-synchronous:osd-music \
        ${art_arg:+"$art_arg"} \
        "$title" "$body"
}

# Run script
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
    next_track)
        playerctl next
        sleep 0.5 && show_music_notif
        ;;
    prev_track)
        playerctl previous
        sleep 0.5 && show_music_notif
        ;;
    play_pause)
        playerctl play-pause
        show_music_notif
        ;;
    *)
        echo "Usage: $0 <volume_up|volume_down|volume_mute|brightness_up|brightness_down|next_track|prev_track|play_pause>"
        exit 1
        ;;
esac
