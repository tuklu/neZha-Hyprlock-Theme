#!/usr/bin/env bash

command -v hyprctl &> /dev/null || { echo "hyprctl missing"; exit 1; }

RAW=$(hyprctl devices | awk -F': ' '/active keymap:/ {print $2; exit}' | xargs)

case "$RAW" in
    "English (US)") LAYOUT="U.S" ;;
    "English (UK)") LAYOUT="U.K" ;;
    "English (Dvorak)") LAYOUT="DVK" ;;
    *)
        LAYOUT=$(echo "$RAW" | awk -F '[()]' '{print $2}')
        [[ -z "$LAYOUT" ]] && LAYOUT="${RAW:0:3}"
        ;;
esac

echo "${LAYOUT} "
