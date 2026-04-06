#!/usr/bin/env bash

# Show keybinds in Rofi and copy selected line to clipboard
cat <<EOF
SUPER + Return        → Open terminal (Foot)
SUPER + Space         → App launcher (Tofi)
SUPER + B             → Browser (Zen)
SUPER + E             → File manager (Thunar)
SUPER + .             → Emoji picker
SUPER + Shift + V     → Clipboard manager (Cliphist)
SUPER + W             → Toggle Waybar
SUPER + S             → Screenshot region to clipboard
SUPER + Shift + S     → Screenshot output to clipboard
SUPER + C             → Color picker
SUPER + Shift + X     → Power menu
SUPER + N             → Toggle blue light filter
SUPER + SHIFT + N     → Toggle DND
SUPER + F9            → Brightness down
SUPER + F10           → Brightness up
SUPER + F11           → Volume down
SUPER + F12           → Volume up
SUPER + Shift + F12   → Mute / unmute
XF86AudioLowerVolume  → Volume down
XF86AudioRaiseVolume  → Volume up
XF86AudioMute         → Mute / unmute
SUPER + F             → Toggle fullscreen
SUPER + Q             → Kill focused window
SUPER + Shift + SPACE → Toggle floating
SUPER + Left Click    → Move window
SUPER + Right Click   → Resize window
SUPER + H             → Focus left
SUPER + J             → Focus down
SUPER + K             → Focus up
SUPER + L             → Focus right
SUPER + Shift + H     → Move window left
SUPER + Shift + J     → Move window down
SUPER + Shift + K     → Move window up
SUPER + Shift + L     → Move window right
SUPER + Alt + H       → Resize window left
SUPER + Alt + L       → Resize window right
SUPER + 1–9           → Switch to tag 1–9
SUPER + Shift + 1–9   → Move window to tag 1–9
EOF
