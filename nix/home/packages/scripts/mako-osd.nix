{
  pkgs ? import <nixpkgs> { },
}:

pkgs.writeTextFile {
  name = "mako-osd";
  executable = true;
  destination = "/bin/mako-osd";

  text = ''
    #!${pkgs.dash}/bin/dash
    # mako-osd : volume/brightness notifier for mako

    NOTIFICATION_TIME=2000
    MAX_VOLUME=100

    bar() {
        ${pkgs.gawk}/bin/awk -v v="$1" 'BEGIN {
            for (i = 0; i < 10; i++)
                s = s (i < int(v/10) ? "▬" : "<span foreground=\"#56595a\">▬</span>")
            print s
        }'
    }

    osd() {
        ${pkgs.libnotify}/bin/notify-send \
            --app-name=osd --urgency=low \
            --expire-time="$NOTIFICATION_TIME" \
            --hint=int:x-mako-width:225 \
            --hint="string:x-canonical-private-synchronous:$1" \
            "$2" "$3"
    }

    vol_notif() {
        vol_raw=$(${pkgs.wireplumber}/bin/wpctl get-volume @DEFAULT_AUDIO_SINK@)
        vol=$(echo "$vol_raw" | ${pkgs.gawk}/bin/awk '{printf "%d", $2 * 100}')
        case "$vol_raw" in
            *'[MUTED]'*) label="Volume (muted)" ;;
            *)            label="Volume" ;;
        esac
        osd osd-volume "$label" "$(bar "$vol")  $vol%"
    }

    bri_notif() {
        bri=$(${pkgs.brightnessctl}/bin/brightnessctl -m \
            | ${pkgs.gawk}/bin/awk -F, '{gsub(/%/,"",$4); print $4}')
        osd osd-brightness "Brightness" "$(bar "$bri")  $bri%"
    }

    validate_step() {
        case "$1" in
            *[!0-9]*|"") echo "Step must be a positive integer"; exit 1 ;;
        esac
    }

    case "$1" in
        --volume-up)
            validate_step "$2"
            current=$(${pkgs.wireplumber}/bin/wpctl get-volume @DEFAULT_AUDIO_SINK@ \
                | ${pkgs.gawk}/bin/awk '{printf "%d", $2 * 100}')
            if [ $(( current + $2 )) -ge "$MAX_VOLUME" ]; then
                ${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ "$MAX_VOLUME%"
            else
                ${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ "$2%+"
            fi
            vol_notif ;;

        --volume-down)
            validate_step "$2"
            current=$(${pkgs.wireplumber}/bin/wpctl get-volume @DEFAULT_AUDIO_SINK@ \
                | ${pkgs.gawk}/bin/awk '{printf "%d", $2 * 100}')
            if [ "$current" -ge "$2" ]; then
                ${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ "$2%-"
            else
                ${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ "0%"
            fi
            vol_notif ;;

        --volume-mute)
            ${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
            vol_notif ;;

        --brightness-up)
            validate_step "$2"
            ${pkgs.brightnessctl}/bin/brightnessctl set "$2%+"
            bri_notif ;;

        --brightness-down)
            validate_step "$2"
            ${pkgs.brightnessctl}/bin/brightnessctl set --min-value=1 "$2%-"
            bri_notif ;;

        *)
            echo "Usage: $0 <--volume-up N|--volume-down N|--volume-mute|--brightness-up N|--brightness-down N>"
            exit 1 ;;
    esac
  '';
}
