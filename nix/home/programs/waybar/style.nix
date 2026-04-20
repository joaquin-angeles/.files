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
      font-family: sans-serif, "MonaspiceNe Nerd Font Propo";
      font-feature-settings: "tnum";
    }

    window#waybar {
      background-color: @bg;
      padding-bottom: 1px;
      border-top: 1px solid darker(@bright-bg);
      font-size: 12pt;
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
      padding-right: 2pt;
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
      margin: 1px 8pt 0 4pt;
    }

    #battery {
      padding: 0 12pt 0 2pt;
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

    #layout {
      background-color: alpha(darker(@bg), 0.8);
      border-left: 1px solid darker(@bright-bg);
      padding: 0 4px 0 4px;
      margin-left: 6pt;
    }

    #tags button {
      color: @bright-bg;
      padding: 0 7pt;
      margin: 1px;
      margin-bottom: 0;
      min-width: 14pt;
      border-radius: 0;
      box-shadow: none;
    }

    #tags button:nth-child(1) {
      font-size: 14pt;
    }

    #tags button:nth-child(4) {
      font-size: 13.5pt;
    }

    #tags button:nth-child(6) {
      font-size: 11pt;
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
      background-color: alpha(darker(@bright-bg), 0.5);
      border-bottom: 2px solid alpha(@blue, 0.8);
      padding-top: 2px;
      padding-left: 7pt;
      padding-right: 7pt;
      min-width: 14pt;
      border-radius: 0;
      box-shadow: none;
      transition: none;
    }

    #tags button:nth-child(7),
    #tags button:nth-child(8),
    #tags button:nth-child(9) {
      color: transparent;
      transition: none;
      margin: 0 -99px;
      padding: 0;
    }

    #tags button:nth-child(7).focused,
    #tags button:nth-child(8).focused,
    #tags button:nth-child(9).focused {
      color: @fg;
      background-color: alpha(darker(@bright-bg), 0.5);
      border-bottom: 2px solid alpha(@blue, 0.8);
      padding-top: 2px;
      padding-left: 7pt;
      padding-right: 7pt;
      min-width: 14pt;
      border-radius: 0;
      box-shadow: none;
      transition: none;
    }

    #tags button:nth-child(7).occupied,
    #tags button:nth-child(8).occupied,
    #tags button:nth-child(9).occupied {
      color: @fg;
      padding: 0 7pt;
      min-width: 14pt;
    }
  '';
}
