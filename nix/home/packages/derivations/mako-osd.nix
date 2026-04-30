{
  pkgs ? import <nixpkgs> { },
}:

pkgs.writeShellApplication {
  name = "mako-osd";

  runtimeInputs = with pkgs; [
    gawk
    libnotify
    wireplumber
    brightnessctl
  ];

  text = ''
    # mako-osd : volume/brightness notifier for mako

    NOTIFICATION_TIME=2000
    MAX_VOLUME=100

    bar() {
      local val=$1
      awk -v v="$val" 'BEGIN {
        for (i = 0; i < 10; i++)
          s = s (i < int(v/10) ? "▬" : "<span foreground=\"#56595a\">▬</span>")
        print s
      }'
    }

    osd() {
      local id=$1 title=$2 body=$3
      notify-send \
        --app-name=osd \
        --urgency=low \
        --expire-time="$NOTIFICATION_TIME" \
        --hint="string:x-canonical-private-synchronous:$id" \
        "$title" "$body"
    }

    get_vol() {
      wpctl get-volume @DEFAULT_AUDIO_SINK@ \
        | awk '{printf "%d", $2 * 100}'
    }

    vol_notif() {
      local vol_raw vol icon
      vol_raw=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
      vol=$(awk '{printf "%d", $2 * 100}' <<< "$vol_raw")

      if [[ "$vol_raw" == *'[MUTED]'* ]]; then
        icon="󰝟"
      elif (( vol >= 70 )); then icon="󰕾"
      elif (( vol >= 50 )); then icon="󰖀"
      elif (( vol >= 25 )); then icon="󰖀"
      else                       icon="󰝟"
      fi

      osd osd-volume "$icon  $vol%" "$(bar "$vol")"
    }

    bri_notif() {
      local bri
      bri=$(brightnessctl -m \
        | awk -F, '{gsub(/%/, "", $4); print $4}')
      osd osd-brightness "󰃠  $bri%" "$(bar "$bri")"
    }

    validate_step() {
      local step=$1
      [[ "$step" =~ ^[0-9]+$ ]] || { echo "Step must be a positive integer"; exit 1; }
    }

    case "$1" in
      --volume-up)
        validate_step "$2"
        current=$(get_vol)
        if (( current + $2 >= MAX_VOLUME )); then
          wpctl set-volume @DEFAULT_AUDIO_SINK@ "$MAX_VOLUME%"
        else
          wpctl set-volume @DEFAULT_AUDIO_SINK@ "$2%+"
        fi
        vol_notif ;;

      --volume-down)
        validate_step "$2"
        current=$(get_vol)
        if (( current >= $2 )); then
          wpctl set-volume @DEFAULT_AUDIO_SINK@ "$2%-"
        else
          wpctl set-volume @DEFAULT_AUDIO_SINK@ "0%"
        fi
        vol_notif ;;

      --volume-mute)
        wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
        vol_notif ;;

      --brightness-up)
        validate_step "$2"
        brightnessctl set "$2%+"
        bri_notif ;;

      --brightness-down)
        validate_step "$2"
        brightnessctl set --min-value=1 "$2%-"
        bri_notif ;;

      *)
        echo "Usage: $0 <--volume-up N|--volume-down N|--volume-mute|--brightness-up N|--brightness-down N>"
        exit 1 ;;
    esac
  '';
}
