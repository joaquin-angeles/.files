{ ... }:

{
  home.file.".var/app/dev.vencord.Vesktop/config/vesktop/themes/midnight-gruvbox.css".text = ''
    @import url("https://refact0r.github.io/midnight-discord/build/midnight.css");

    body {
      --font: "Inter";
      --gap: 12px;
      --divider-thickness: 4px;
      --border-thickness: 1px;
      --animations: on;
      --list-item-transition: 0.2s ease;
      --dms-icon-svg-transition: 0.4s ease;
      --border-hover-transition: 0.2s ease;
      --top-bar-height: var(--gap);
      --top-bar-button-position: titlebar;
      --top-bar-title-position: off;
      --subtle-top-bar-title: off;
      --custom-window-controls: on;
      --window-control-size: 14px;
      --custom-dms-icon: custom;
      --dms-icon-svg-url: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 27 27' width='24' height='24'%3E%3Cpath fill='currentColor' d='M0 0h7v1H6v1H5v1H4v1H3v1H2v1h5v1H0V6h1V5h1V4h1V3h1V2h1V1H0m13 2h5v1h-1v1h-1v1h-1v1h3v1h-5V7h1V6h1V5h1V4h-3m8 5h1v5h1v-1h1v1h-1v1h1v-1h1v1h-1v3h-1v1h-2v1h-1v1h1v-1h2v-1h1v2h-1v1h-2v1h-1v-1h-1v1h-6v-1h-1v-1h-1v-2h1v1h2v1h3v1h1v-1h-1v-1h-3v-1h-4v-4h1v-2h1v-1h1v-1h1v2h1v1h1v-1h1v1h-1v1h2v-2h1v-2h1v-1h1M8 14h2v1H9v4h1v2h1v1h1v1h1v1h4v1h-6v-1H5v-1H4v-5h1v-1h1v-2h2m17 3h1v3h-1v1h-1v1h-1v2h-2v-2h2v-1h1v-1h1m1 0h1v3h-1v1h-2v-1h1v-1h1'%3E%3C/path%3E%3C/svg%3E");
      --dms-icon-svg-size: 90%;
      --dms-icon-color-before: var(--icon-subtle);
      --dms-icon-color-after: var(--white);
      --custom-dms-background: off;
      --background-image: off;
      --transparency-tweaks: off;
      --remove-bg-layer: off;
      --panel-blur: off;
      --blur-amount: 12px;
      --bg-floating: var(--bg-3);
      --custom-chatbar: off;
      --chatbar-height: 47px;
      --small-user-panel: on;
    }

    :root {
      --colors: on;

      --text-0: var(--bg-4);
      --text-1: hsl(38, 47%, 90%);
      --text-2: hsl(38, 47%, 80%);
      --text-3: #d4be98;
      --text-4: #a79a83;
      --text-5: #d4be9866;

      --bg-1: hsl(20, 5%, 25%);
      --bg-2: #3c3836;
      --bg-3: #141617;
      --bg-4: #1d2021;
      --hover: hsla(20, 3%, 40%, 0.1);
      --active: hsla(20, 3%, 40%, 0.2);
      --active-2: hsla(20, 3%, 40%, 0.3);
      --message-hover: hsla(0, 0%, 0%, 0.1);

      --accent-1: #7daea3;
      --accent-2: #7daea3;
      --accent-3: #7daea3;
      --accent-4: #7daea3;
      --accent-5: #7daea3;
      --accent-new: var(--accent-2);
      --mention: linear-gradient(to right, color-mix(in hsl, var(--accent-2), transparent 90%) 40%, transparent);
      --mention-hover: linear-gradient(to right, color-mix(in hsl, var(--accent-2), transparent 95%) 40%, transparent);
      --reply: linear-gradient(to right, color-mix(in hsl, var(--text-3), transparent 90%) 40%, transparent);
      --reply-hover: linear-gradient(to right, color-mix(in hsl, var(--text-3), transparent 95%) 40%, transparent);

      --online: var(--green-2);
      --dnd: var(--red-2);
      --idle: var(--yellow-2);
      --streaming: var(--purple-2);
      --offline: var(--text-4);

      --border-light: var(--hover);
      --border: var(--active);
      --border-hover: var(--active);
      --button-border: hsl(0, 0%, 100%, 0.1);

      --red-1: hsl(3, 76%, 70%);   --red-2: #ea6962;   --red-3: #ea6962;   --red-4: hsl(3, 76%, 60%);   --red-5: hsl(3, 76%, 55%);
      --green-1: hsl(70, 36%, 60%); --green-2: #a8b665; --green-3: #a8b665; --green-4: hsl(70, 36%, 50%); --green-5: hsl(70, 36%, 45%);
      --blue-1: hsl(167, 24%, 63%); --blue-2: #7caea3;  --blue-3: #7caea3;  --blue-4: hsl(167, 24%, 53%); --blue-5: hsl(167, 24%, 48%);
      --yellow-1: hsl(37, 63%, 64%); --yellow-2: #d8a656; --yellow-3: #d8a656; --yellow-4: hsl(37, 63%, 54%); --yellow-5: hsl(37, 63%, 49%);
      --purple-1: hsl(344, 47%, 73%); --purple-2: #d3869b; --purple-3: #d3869b; --purple-4: hsl(344, 47%, 63%); --purple-5: hsl(344, 47%, 58%);
    }
  '';
}
