#!/usr/bin/env dash
# osd.sh — volume/brightness notifier for mako

VS=5 BS=5 MV=100 NT=2000

bar(){ awk -v v="$1" 'BEGIN{n=10;f=int(v*n/100);for(i=0;i<f;i++)b=b"▬";for(i=f;i<n;i++)d=d"▬";print b"<span foreground=\"#56595a\">"d"</span>"}';}
osd(){ notify-send --app-name=osd --urgency=low --expire-time="$NT" --hint=int:x-mako-width:225 --hint="string:x-canonical-private-synchronous:$1" "$2" "$3";}

vol_notif(){
    _r=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
    v=$(echo "$_r"|awk '{printf "%d",$2*100}')
    echo "$_r"|grep -q '\[MUTED\]' && i="󰖁" || { [ "$v" -eq 0 ]&&i="󰝟"||{ [ "$v" -lt 50 ]&&i="󰖀"||i="󰕾";};};
osd osd-volume "      $i   Volume" "$(bar "$v")  ${v}%";}

bri_notif(){
    b=$(brightnessctl -m|awk -F, '{gsub(/%/,"",$4);print $4}')
    [ "$b" -eq 0 ]&&i="󰃞"||{ [ "$b" -lt 50 ]&&i="󰃟"||i="󰃠";}
osd osd-brightness "      $i   Brightness" "$(bar "$b")  ${b}%";}

case "$1" in
    volume_up)
        v=$(wpctl get-volume @DEFAULT_AUDIO_SINK@|awk '{printf "%d",$2*100}')
        [ $((v+VS)) -gt "$MV" ]&&wpctl set-volume @DEFAULT_AUDIO_SINK@ "${MV}%"||wpctl set-volume @DEFAULT_AUDIO_SINK@ "${VS}%+"
        wpctl set-mute @DEFAULT_AUDIO_SINK@ 0;vol_notif ;;
    volume_down)   wpctl set-volume @DEFAULT_AUDIO_SINK@ "${VS}%-";vol_notif ;;
    volume_mute)   wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle;vol_notif ;;
    brightness_up)   brightnessctl set "${BS}%+";bri_notif ;;
    brightness_down) brightnessctl set "${BS}%-";bri_notif ;;
    *) echo "Usage: $0 <volume_up|volume_down|volume_mute|brightness_up|brightness_down>";exit 1 ;;
esac
