#!/usr/bin/env bash
set -e

REPO="tuklu/neZha-Hyprlock-Theme"
HYPR="$HOME/.config/hypr"
THEME="$HYPR/neZha-Hyprlock-Theme"

LATEST=$(curl -fsSL "https://api.github.com/repos/$REPO/releases/latest" \
    | grep '"tag_name"' | head -1 | sed 's/.*"tag_name": *"\([^"]*\)".*/\1/')

[[ -z "$LATEST" ]] && { echo "couldn't fetch release tag"; exit 1; }

BASE="https://github.com/$REPO/releases/download/$LATEST"

mkdir -p "$THEME" "$HYPR/scripts"

curl -fsSL "$BASE/source.tar.xz" | tar -xJ -C "$THEME" --strip-components=1
echo "assets are ~40MB, grab a coffee..."
curl -fsSL "$BASE/assets.tar.xz" | tar -xJ -C "$THEME"

cp "$THEME/scripts/"*.sh "$HYPR/scripts/"
chmod +x "$HYPR/scripts/"*.sh

sed "s|./assets/|$THEME/assets/|g" "$THEME/hyprlock.conf" > "$HYPR/hyprlock.conf"

echo "done. config at $HYPR/hyprlock.conf"
echo "not on omarchy? drop the first line in that conf"
