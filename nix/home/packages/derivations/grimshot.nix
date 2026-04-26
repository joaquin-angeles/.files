{
  pkgs ? import <nixpkgs> { },
}:

pkgs.writeTextFile {
  name = "grimshot";
  executable = true;
  destination = "/bin/grimshot";

  text = ''
    #!${pkgs.dash}/bin/dash

    case "$1" in
        --region)
            trap '${pkgs.procps}/bin/pkill wayfreeze 2>/dev/null' EXIT
            ${pkgs.wayfreeze}/bin/wayfreeze &
            ${pkgs.coreutils}/bin/sleep 0.2
            if ${pkgs.procps}/bin/pgrep wayfreeze > /dev/null; then
                ${pkgs.grim}/bin/grim -g "$(${pkgs.slurp}/bin/slurp -d)" - | ${pkgs.wl-clipboard}/bin/wl-copy --type image/png
                ${pkgs.libnotify}/bin/notify-send "Screenshot saved" "Image copied to clipboard"
            fi
            ;;
        --output)
            ${pkgs.grim}/bin/grim - | ${pkgs.wl-clipboard}/bin/wl-copy --type image/png
            ${pkgs.libnotify}/bin/notify-send "Screenshot saved" "Image copied to clipboard"
            ;;
        *)
            printf 'usage\n--region (capture specific part of screen)\n--output (capture entire screen)\n'
    esac
  '';
}
