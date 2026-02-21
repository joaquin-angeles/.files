#!/usr/bin/env bash

if pgrep sunsetr >/dev/null; then
    pkill sunsetr
else
    sunsetr test 4000 100 &
fi
