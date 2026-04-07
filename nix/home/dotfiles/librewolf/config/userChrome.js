const { classes: Cc, interfaces: Ci, utils: Cu } = Components;

Cu.import("resource://gre/modules/Services.jsm");

Services.obs.addObserver((win) => {
  win.addEventListener("keydown", (e) => {
    if (e.ctrlKey && e.key === "t") {
      e.preventDefault();
      e.stopPropagation();
      win.gURLBar.focus();
      win.gURLBar.select();
    }
  }, true);
}, "domwindowopened");
