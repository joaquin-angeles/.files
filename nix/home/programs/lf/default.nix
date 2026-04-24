{ pkgs, ... }:

{
  xdg.configFile."lf/icons".source = ./icons;

  programs.lf = {
    enable = true;
    commands = {
      dragon-out = ''%${pkgs.xdragon}/bin/xdragon -a -x "$fx"'';

      open = ''
        ${{
          if (command -v bat >/dev/null 2>&1 && bat "$f" > /dev/null 2>&1) || cat "$f" > /dev/null 2>&1; then
            nvim "$f"
          else
            case $(file --mime-type "$f" -bL) in
              image/*) swayimg "$f" ;;
              application/x-executable) "$f" ;;
              *) xdg-open "$f" ;;
            esac
          fi
        }}
      '';

      fzf_jump = ''
        ${{
          res="$(fzf --walker=file,dir,follow,hidden --walker-skip=.git,node_modules,.Trash)"
          if [ -n "$res" ]; then
            if [ -d "$res" ]; then
              cmd="cd"
            else
              cmd="select"
            fi
            lf -remote "send $id $cmd \"$res\""
          fi
        }}
      '';
    };

    keybindings = {
      "." = "set hidden!";
      D = "delete";
      p = "paste";
      x = "cut";
      y = "copy";
      n = "push %touch<space>";
      N = "push %mkdir<space>";
      "<enter>" = "open";
      r = "rename";
      H = "top";
      J = "scroll-preview-down";
      K = "scroll-preview-up";
      L = "bottom";
      R = "reload";
      U = "clear";
      u = "unselect";
      zf = "fzf_jump";
      do = "dragon-out";
    };

    settings = {
      preview = true;
      hidden = true;
      drawbox = true;
      icons = true;
      ignorecase = true;
    };

    extraConfig =
    let
      previewer =
        pkgs.writeShellScriptBin "pv.sh" ''
        file=$1
        w=$2
        h=$3
        x=$4
        y=$5

        if [[ "$( ${pkgs.file}/bin/file -Lb --mime-type "$file")" =~ ^image ]]; then
            ${pkgs.kitty}/bin/kitty +kitten icat --silent --stdin no --transfer-mode file --place "''${w}x''${h}@''${x}x''${y}" "$file" < /dev/null > /dev/tty
            exit 1
        fi

        ${pkgs.pistol}/bin/pistol "$file"
      '';
      cleaner = pkgs.writeShellScriptBin "clean.sh" ''
        ${pkgs.kitty}/bin/kitty +kitten icat --clear --stdin no --silent --transfer-mode file < /dev/null > /dev/tty
      '';
    in
    ''
      set cleaner ${cleaner}/bin/clean.sh
      set previewer ${previewer}/bin/pv.sh
    '';
  };

  # ...
}
