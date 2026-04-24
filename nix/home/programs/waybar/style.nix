{ ... }:

{
  programs.waybar.style = ''
    @define-color black       #1d2021;
    @define-color brightblack #56595a;
    @define-color white       #d4be98;
    @define-color red         #ea6962;
    @define-color green       #a9b665;
    @define-color yellow      #d8a657;
    @define-color blue        #7daea3;
    @define-color magenta     #d3869b;
    @define-color cyan        #89b482;

    window#waybar {
      font-family: sans-serif, "MonaspiceNe Nerd Font Propo";
      font-feature-settings: "tnum";
      background-color: @black;
      padding-bottom: 1px;
      border-bottom: 1px solid #32332f;
      font-size: 12pt;
      color: @white;
    }

    #tags button {
      font-family: "MonaspiceNe Nerd Font Propo";
      font-size: 12.5pt;
      color: @brightblack;
      padding: 0 5pt;
      margin: 0 5pt;
      min-width: 10pt;
      border-radius: 0;
      transition: none;
    }

    /* Tag settings */
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
      margin-top: -1px;
      padding-top: 1px;
      font-size: 15pt;
    }
    #tags button:nth-child(1).focused {
      padding-top: 4px;
    }

    #tags button:nth-child(4) {
      font-size: 14pt;
    }

    #tags button:nth-child(6),
    #tags button:nth-child(7),
    #tags button:nth-child(8),
    #tags button:nth-child(9) {
      font-family: sans-serif, "MonaspiceNe Nerd Font Propo";
      font-size: 12pt;
      color: transparent;
      transition: none;
      margin: 0 -99px;
      padding: 0;
    }

    #tags button:nth-child(6).focused,
    #tags button:nth-child(7).focused,
    #tags button:nth-child(8).focused,
    #tags button:nth-child(9).focused,
    #tags button:nth-child(6).occupied,
    #tags button:nth-child(7).occupied,
    #tags button:nth-child(8).occupied,
    #tags button:nth-child(9).occupied {
      color: @white;
      padding: 0 4pt;
      margin: 0 4pt;
      min-width: 8pt;
      border-radius: 0;
      transition: none;
    }

    #tags button:nth-child(6).focused,
    #tags button:nth-child(7).focused,
    #tags button:nth-child(8).focused,
    #tags button:nth-child(9).focused {
      padding-top: 4px;
      margin-bottom: 2px;
    }

    #sys-info {
      margin-right: 3pt;
      min-width: 12pt;
    }

    #custom-expand-icon {
      padding-right: 2pt;
    }

    #tray {
      padding-left: 5pt;
      padding-right: 2pt;
    }

    #network {
      font-size: 12.5pt;
      padding: 0 7pt 0 8pt;
    }

    #pulseaudio {
      font-size: 14pt;
      margin: 0px 8pt 0 4pt;
    }

    #battery {
      padding: 0 8pt 0 4pt;
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

    #clock {
      padding: 0 10pt 0 5pt;
    }

    #layout {
      background-color: darker(@black);
      border-left: 1px solid #32332f;
      padding: 0 4px 0 4px;
    }
  '';
}
