#!/usr/bin/env zsh

BAT=$(find /sys/class/power_supply -maxdepth 1 -mindepth 1 -exec sh -c '[ -f "$1/type" ] && grep -q "Battery" "$1/type"' _ {} \; -print -quit)

[[ -z "$BAT" ]] && { echo "no battery"; exit 0; }

CAP=$(cat "$BAT/capacity")
STATUS=$(cat "$BAT/status")

CHARGE=("󰢜" "󰂆" "󰂇" "󰂈" "󰢝" "󰂉" "󰢞" "󰂊" "󰂋" "󰂅")
DISCHARGE=("󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹")

IDX=$(( CAP / 10 ))
[[ $IDX -eq 10 ]] && IDX=9

case "$STATUS" in
    Charging) ICON="${CHARGE[$IDX]}" ;;
    Full)     ICON="󰂅" ;;
    *)        ICON="${DISCHARGE[$IDX]}" ;;
esac

echo "${CAP}%  ${ICON}"
