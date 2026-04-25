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

    VOLUME_STEP=5
    BRIGHTNESS_STEP=5
    MAX_VOLUME=100
    NOTIFICATION_TIME=2000

    bar() {
        ${pkgs.gawk}/bin/awk -v v="$1" '
            BEGIN {
            n = 10
            filled = int(v * n / 100)
            for (i = 0; i < filled; i++) filled_bar = filled_bar "▬"
            for (i = filled; i < n; i++) empty_bar = empty_bar "▬"
            print filled_bar "<span foreground=\"#56595a\">" empty_bar "</span>"
        }'
    }

    osd() {
        ${pkgs.libnotify}/bin/notify-send \
            --app-name=osd \
            --urgency=low \
            --expire-time="$NOTIFICATION_TIME" \
            --hint=int:x-mako-width:225 \
            --hint="string:x-canonical-private-synchronous:$1" \
            "$2" \
            "$3"
    }

    vol_notif() {
        vol_raw=$(${pkgs.wireplumber}/bin/wpctl get-volume @DEFAULT_AUDIO_SINK@)
        vol=$(echo "$vol_raw" | ${pkgs.gawk}/bin/awk '{printf "%d", $2 * 100}')

        indicator=""
        if echo "$vol_raw" | ${pkgs.gnugrep}/bin/grep -q '\[MUTED\]'; then
            indicator="(muted)"
        fi

        osd osd-volume "Volume $indicator" "$(bar "$vol")  ''${vol}%"
    }

    bri_notif() {
        bri=$(${pkgs.brightnessctl}/bin/brightnessctl -m | ${pkgs.gawk}/bin/awk -F, '{gsub(/%/,"",$4); print $4}')
        osd osd-brightness "Brightness" "$(bar "$bri")  ''${bri}%"
    }

    case "$1" in
        volume_up)
            current=$(${pkgs.wireplumber}/bin/wpctl get-volume @DEFAULT_AUDIO_SINK@ | ${pkgs.gawk}/bin/awk '{printf "%d", $2 * 100}')

            if [ $(( current + VOLUME_STEP )) -gt "$MAX_VOLUME" ]; then
                ${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ "''${MAX_VOLUME}%"
            else
                ${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ "''${VOLUME_STEP}%+"
            fi

            ${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SINK@ 0
            vol_notif
            ;;

        volume_down)
            ${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ "''${VOLUME_STEP}%-"
            vol_notif
            ;;

        volume_mute)
            ${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
            vol_notif
            ;;

        brightness_up)
            ${pkgs.brightnessctl}/bin/brightnessctl set "''${BRIGHTNESS_STEP}%+"
            bri_notif
            ;;

        brightness_down)
            ${pkgs.brightnessctl}/bin/brightnessctl set "''${BRIGHTNESS_STEP}%-"
            bri_notif
            ;;

        *)
            echo "Usage: $0 <volume_up|volume_down|volume_mute|brightness_up|brightness_down>"
            exit 1
            ;;
    esac
  '';
}
