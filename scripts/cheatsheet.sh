#!/usr/bin/env bash

# Show keybinds in Rofi and copy selected line to clipboard
cat <<EOF
SUPER + Return        → Open terminal (Alacritty)
SUPER + Space         → App launcher (Rofi)
SUPER + B             → Browser (Zen)
SUPER + E             → File manager (Nautilus)
SUPER + .             → Emoji picker
SUPER + V             → Clipboard manager (Cliphist)
SUPER + R             → Reload WM config
SUPER + W             → Toggle Waybar
SUPER + S             → Screenshot output to clipboard
SUPER + Shift + S     → Screenshot region to clipboard
SUPER + Shift + P     → Color picker
SUPER + Shift + E     → Power menu
Ctrl + Alt + B        → Toggle blue light filter
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
SUPER + Shift + F     → Toggle floating
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
SUPER + 1–9           → Switch to workspace 1–9
SUPER + 0             → Switch to workspace 10
SUPER + Tab           → Next workspace
SUPER + Shift + 1–9   → Move window to workspace 1–9
SUPER + Shift + 0     → Move window to workspace 10
SUPER + Shift + Tab   → Previous workspace
EOF
