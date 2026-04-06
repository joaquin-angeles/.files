{ ... }:

{
  programs.librewolf = {
    enable = true;
    settings = {
      "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      "browser.tabs.drawInTitlebar" = true;
      "browser.uidensity" = 1;
    };
    userChrome = ''
      #TabsToolbar { 
        visibility: collapse !important; 
      }
      #nav-bar {
        visibility: collapse !important;
      }
    '';
  };
}
