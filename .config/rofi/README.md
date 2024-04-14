## Menu rofi

```bash
sudo pacman -S rofi
```

Configuration

```bash
Key([mod], "m", lazy.spawn("rofi -show drun"))
Key([mod], "shift", "m", lazy.spawn("rofi -show"))
```
