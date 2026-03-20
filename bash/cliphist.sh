#!/usr/bin/env bash

nohup wl-paste --type text --watch cliphist store >/dev/null 2>&1 &
nohup wl-paste --type image --watch cliphist store >/dev/null 2>&1 &
