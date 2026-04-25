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
        "--region")
            trap '${pkgs.wayfreeze}/bin/wayfreeze 2>/dev/null' EXIT
            ${pkgs.wayfreeze}/bin/wayfreeze &
            ${pkgs.coreutils}/bin/sleep 0.2
            ${pkgs.grim}/bin/grim -g "$(${pkgs.slurp}/bin/slurp -d)" - | ${pkgs.wl-clipboard}/bin/wl-copy --type image/png && ${pkgs.libnotify}/bin/notify-send "Screenshot saved" "Image copied to clipboard"
            ;;
        "--output")
            ${pkgs.grim}/bin/grim - | ${pkgs.wl-clipboard}/bin/wl-copy --type image/png && ${pkgs.libnotify}/bin/notify-send "Screenshot saved" "Image copied to clipboard"
            ;;
        *)
            echo "usage\n--region (capture specific part of screen)\n--output (capture entire screen)"
    esac
  '';
}
