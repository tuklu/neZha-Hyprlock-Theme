# neZha hyprlock theme

lock screen for [hyprlock](https://github.com/hyprwm/hyprlock). goes with the [neZha sddm theme](https://github.com/tuklu/neZha-SDDM-Theme) so login and lock look the same.

![preview](assets/screenshot.webp)

```sh
curl -fsSL https://raw.githubusercontent.com/tuklu/neZha-Hyprlock-Theme/main/install.sh | bash
```

grabs the latest release into `~/.config/hypr/neZha-Hyprlock-Theme/`, copies the status scripts to `~/.config/hypr/scripts/` and writes `~/.config/hypr/hyprlock.conf`. images are ~40MB so give it a sec.

## what you get

- big steelfish clock with the date under it
- foreground layer over the background for depth
- password field
- status bar top right: keyboard layout, wifi, volume, battery

## needs

- hyprlock, hyprctl (keyboard layout), iwctl (wifi), pamixer (volume)
- fonts: steelfish outline, sf pro display bold, any nerd font

## manual install

```sh
git clone https://github.com/tuklu/neZha-Hyprlock-Theme ~/.config/hypr/neZha-Hyprlock-Theme
cd ~/.config/hypr/neZha-Hyprlock-Theme
curl -fsSL https://github.com/tuklu/neZha-Hyprlock-Theme/releases/latest/download/assets.tar.xz | tar -xJ
mkdir -p ~/.config/hypr/scripts && cp scripts/*.sh ~/.config/hypr/scripts/
sed -e "s|\./assets/|$PWD/assets/|g" -e "s|\./colors.conf|$PWD/colors.conf|" hyprlock.conf > ~/.config/hypr/hyprlock.conf
```

images arent in git, they only ship with the release.

## colors

all of them are in `colors.conf`. edit that, or point the `source` line at your own file with the same vars: `$color` `$clock_color` `$inner_color` `$outer_color` `$font_color` `$check_color` `$fail_color` `$status_color`

## releasing

```sh
git tag v1.1.0 && git push origin v1.1.0
```

ci builds `source.tar.xz` and attaches the images from the `assets` pre-release. new images: `gh release upload assets assets.tar.xz --clobber`

## license

[MIT](LICENSE)
