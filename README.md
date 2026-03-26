# neZha — Hyprlock Theme

A minimal, visually layered lock screen theme for [Hyprlock](https://github.com/hyprwulf/hyprlock), designed to pair with the [neZha SDDM Theme](https://github.com/tuklu/neZha-SDDM-Theme).

![Preview](assets/screenshot.webp)

---

## Assets notice

The theme assets (`backgrounds/`, `foreground/`) total ~40 MB. The git repository includes them for convenience, but **if you are cloning just to install, use the [release download](#installation) instead** — the install script pulls only what it needs from the release and is much faster.

---

## Features

- Large typographic clock (Steelfish Outline)
- Day / month / date label
- Foreground image overlay for depth
- Password input field with custom placeholder
- Top-right system status bar: keyboard layout · network · volume · battery
- Integrates with [Omarchy](https://github.com/basecamp/omarchy) theme system

---

## Dependencies

| Tool | Purpose |
|------|---------|
| [hyprlock](https://github.com/hyprwulf/hyprlock) | Lock screen daemon |
| [hyprctl](https://wiki.hyprland.org/Hypr-Ecosystem/hyprctl/) | Keyboard layout detection |
| [iwctl](https://iwd.wiki.kernel.org/) | Wi-Fi status |
| [pamixer](https://github.com/cdemoulins/pamixer) | Volume status |
| Steelfish Outline font | Clock typeface |
| SF Pro Display Bold font | UI labels |
| Nerd Fonts | Status bar icons |

---

## Installation

### Recommended — install script (downloads from release)

```sh
curl -fsSL https://raw.githubusercontent.com/tuklu/neZha-Hyprlock-Theme/main/install.sh | bash
```

This will:
- Download and extract the latest `assets.tar.xz` and `source.tar.xz` from the GitHub release
- Install everything under `~/.config/hypr/neZha-Hyprlock-Theme/`
- Copy the scripts to `~/.config/hypr/scripts/` and make them executable
- Write `~/.config/hypr/hyprlock.conf` with correct absolute asset paths

### Manual setup

1. Clone the repo (includes all assets, ~40 MB):
   ```sh
   git clone https://github.com/tuklu/neZha-Hyprlock-Theme ~/.config/hypr/neZha-Hyprlock-Theme
   ```

2. Copy the scripts and make them executable:
   ```sh
   cp ~/.config/hypr/neZha-Hyprlock-Theme/scripts/*.sh ~/.config/hypr/scripts/
   chmod +x ~/.config/hypr/scripts/*.sh
   ```

3. Write `hyprlock.conf` with absolute asset paths:
   ```sh
   THEME=~/.config/hypr/neZha-Hyprlock-Theme
   sed "s|./assets/|$THEME/assets/|g" "$THEME/hyprlock.conf" > ~/.config/hypr/hyprlock.conf
   ```

4. *(Optional)* If you are **not** using Omarchy, remove or replace the first line of your new `~/.config/hypr/hyprlock.conf`:
   ```
   source = ~/.config/omarchy/current/theme/hyprlock.conf
   ```
   Replace the `$color`, `$outer_color`, `$inner_color`, and `$font_color` variables with literal `rgba(...)` values from your theme.

---

## Related

**[neZha SDDM Theme](https://github.com/tuklu/neZha-SDDM-Theme)** — the matching login screen theme for SDDM. Use both for a consistent look from login to lock screen.

---

## License

[MIT](LICENSE) © tuklu
