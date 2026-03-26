#!/usr/bin/env zsh

command -v iwctl &> /dev/null || { echo "󰤮"; exit 1; }

DEVICE=$(iwctl station list | sed 's/\x1B\[[0-9;]*[a-zA-Z]//g' | awk '/connected/ {for(i=1;i<=NF;i++) if($i=="connected") print $(i-1)}')

[[ -z "$DEVICE" ]] && { echo "󰤯"; exit 0; }

RSSI=$(iwctl station "$DEVICE" show | sed 's/\x1B\[[0-9;]*[a-zA-Z]//g' | awk '/^[ \t]*RSSI/ {print $2}')

if [[ -n "$RSSI" && "$RSSI" =~ ^-[0-9]+$ ]]; then
    if   (( RSSI >= -60 )); then ICON="󰤨"
    elif (( RSSI >= -70 )); then ICON="󰤥"
    elif (( RSSI >= -80 )); then ICON="󰤢"
    elif (( RSSI >= -89 )); then ICON="󰤟"
    else ICON="󰤯"
    fi
else
    ICON="󰤨"
fi

echo "${ICON}"
