## Menu rofi

Install

```bash
sudo pacman -S rofi
```

Configuration Qtile

```bash
Key([mod], "m", lazy.spawn("rofi -show drun"))
Key([mod], "shift", "m", lazy.spawn("rofi -show"))
```

## Themes
