{ ... }:

{
  programs.waybar.style = ''
    @define-color black   #1d2021;
    @define-color gray    #56595a;
    @define-color border  #32332f;
    @define-color white   #d4be98;
    @define-color red     #ea6962;
    @define-color green   #a9b665;
    @define-color yellow  #d8a657;
    @define-color blue    #7daea3;
    @define-color magenta #d3869b;
    @define-color cyan    #89b482;

    /* Global settings */
    * {
      font-family: sans-serif, "MonaspiceNe Nerd Font Propo";
      font-feature-settings: "tnum";
    }

    window#waybar {
      font-size: 12.5pt;
      background-color: @black;
      padding-bottom: 1px;
      border-bottom: 1px solid @border;
      color: @white;
    }

    /* Tag button settings */
    #tags button {
      color: @gray;
      padding: 0 6px;
      margin: 0 6px;
      min-width: 12px;
      min-height: 0;
      transition: none;
      border-radius: 0;
    }

    #tags button.focused {
      padding-top: 4px;
      border-bottom: 2px solid @cyan;
      margin-bottom: 2px;
    }

    #tags button:hover {
      color: @cyan;
      background: transparent;
    }

    #tags button.occupied {
      color: @white;
    }
    #tags button.urgent {
      color: @red;
    }

    /* Per-tag size adjustments */
    #tags button:nth-child(1) {
      font-size: 15pt;
      margin-top: -1px;
      padding-top: 1px;
    }

    #tags button:nth-child(3) {
      font-size: 13pt;
      padding-top: 1px;
    }

    #tags button:nth-child(4) {
      font-size: 14pt;
    }

    #tags button:nth-child(1).focused {
      padding-top: 4px;
    }

    #tags button:nth-child(3).focused {
      padding-top: 5px;
    }

    #tags button:nth-child(n + 6):nth-child(-n + 9) {
      font-size: 12pt;
      color: transparent;
      margin: 0 -99px;
      padding: 0;
    }

    #tags button:nth-child(n + 6):nth-child(-n + 9).focused,
    #tags button:nth-child(n + 6):nth-child(-n + 9).occupied {
      color: @white;
      padding: 0 5px;
      margin: 0 5px;
      min-width: 10px;
      min-height: 0;
    }

    #tags button:nth-child(n + 6):nth-child(-n + 9).focused {
      padding-top: 4px;
      margin-bottom: 2px;
    }

    /* Per-module styling */
    #custom-expand-icon {
      font-family: "MonaspiceNe Nerd Font Propo";
      font-size: 14pt;
    }

    #sys-info {
      margin-right: 6pt;
      min-width: 12pt;
    }

    #tray {
      padding-left: 8pt;
    }

    #network {
      font-size: 12.5pt;
      padding: 0 9pt 0 10pt;
    }

    #pulseaudio {
      font-size: 14.5pt;
      margin: 0 4pt;
    }

    #battery {
      padding: 0 10pt 0 4pt;
    }

    #battery.full {
      color: @cyan;
    }
    #battery.charging {
      color: @green;
    }
    #battery.low {
      color: @yellow;
    }

    #battery.critical {
      color: @red;
      font-weight: bold;
    }

    #clock {
      padding: 0 10pt 0 2pt;
    }

    #layout {
      font-family: monospace;
      background-color: darker(@black);
      color: @gray;
      border-left: 1px solid @border;
      padding: 0 4px;
    }
  '';
}
