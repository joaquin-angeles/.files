{ ... }:

{
  programs.waybar.style = ''
    @define-color bg                     #1d2021;
    @define-color fg                     #d4be98;
    @define-color red                    #ea6962;
    @define-color green                  #a9b665;
    @define-color yellow                 #d8a657;
    @define-color blue                   #7daea3;
    @define-color magenta                #d3869b;
    @define-color cyan                   #89b482;
    @define-color bright-bg              #56595a;
    @define-color bright-fg              #fff0be;
    @define-color bright-red             #ff847b;
    @define-color bright-green           #d3e17e;
    @define-color bright-yellow          #ffcf6d;
    @define-color bright-blue            #acdfff;
    @define-color bright-magenta         #ffacc2;
    @define-color bright-cyan            #9cd9cc;

    * {
      font-family: "MonaspiceNe Nerd Font Propo";
      font-size: 12pt;
      font-feature-settings: "tnum";
    }

    window#waybar {
      /* background-color: alpha(@bg, 0.85); */
      background-color: @bg;
      color: @fg;
    }

    #sys-info {
      margin-right: 3pt;
      min-width: 12pt;
    }

    #clock {
      padding: 0 6pt 0 2pt;
    }

    #window {
      margin: 0 0 0 10pt;
    }

    #custom-expand-icon {
      padding-right: 5pt;
    }

    #tray {
      padding-left: 5pt;
      padding-right: 2pt;
    }

    #bluetooth,
    #custom-power {
      font-size: 13.5pt;
    }

    #bluetooth {
      padding: 0 3pt 0 9pt;
    }

    #custom-separator {
      font-family: sans-serif;
      color: alpha(@bright-bg, 0.8);
    }

    #custom-power {
      color: @red;
      padding: 0.5px 5pt 0 5pt;
    }

    #network {
      font-size: 12.5pt;
      padding: 0 7pt 0 8pt;
    }

    #pulseaudio {
      font-size: 14pt;
      margin: 1px 4pt 0 8pt;
    }

    #battery {
      padding: 0 12pt 0 4pt;
    }

    #battery span.icon {
      font-size: 13.5pt;
    }

    #battery.low {
      color: @yellow;
    }

    #battery.critical {
      color: @red;
      font-weight: bold;
    }

    /* Tags: buttons 1–5 (always visible) */
    #tags button:nth-child(1),
    #tags button:nth-child(2),
    #tags button:nth-child(3),
    #tags button:nth-child(4),
    #tags button:nth-child(5),
    #tags button:nth-child(6) {
      color: @bright-bg;
      padding: 0 5pt;
      min-width: 10pt;
      margin: 1px;
      /* background: darker(darker(@bright-bg));
      border: 1px solid darker(@bright-bg); */
      border-radius: 0;
      box-shadow: none;
    }

    #tags button:hover {
      color: @blue;
    }
    #tags button.occupied {
      color: @fg;
    }
    #tags button.urgent {
      color: @red;
    }

    #tags button.focused {
      color: @blue;
      /* background-color: darker(darker(@blue));
      border: 1px solid darker(@blue); */
    }

    /* Tags: buttons 6–9 (hidden unless occupied/focused) */
    #tags button:nth-child(7),
    #tags button:nth-child(8),
    #tags button:nth-child(9) {
      color: transparent;
      margin: 0 -99;
      padding: 0;
      font-size: 0;
      border: 0;
      border-radius: 0;
      min-width: 0;
      transition: none;
      animation: none;
      box-shadow: none;
      text-shadow: none;
    }

    #tags button:nth-child(7).occupied,
    #tags button:nth-child(8).occupied,
    #tags button:nth-child(9).occupied {
      color: @fg;
      font-size: 12pt;
      padding: 0 5pt;
      margin: 1px;
      min-width: 10pt;
      /* background-color: darker(darker(@bright-bg));
      border: 1px solid alpha(@bright-bg, 0.8); */
      border-radius: 0;
      box-shadow: none;
    }

    #tags button:nth-child(7).focused,
    #tags button:nth-child(8).focused,
    #tags button:nth-child(9).focused {
      color: @blue;
      font-size: 12pt;
      padding: 0 5pt;
      margin: 1px;
      min-width: 10pt;
      /* background-color: darker(darker(@blue));
      border: 1px solid alpha(darker(@blue), 0.8); */
      border-radius: 0;
      box-shadow: none;
    }
  '';
}
