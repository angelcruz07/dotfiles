## Menu rofi

Menu de teclado

```bash
sudo pacman -S rofi
```

Configuracion

```bash
Key([mod], "m", lazy.spawn("rofi -show drun"))
Key([mod], "shift", "m", lazy.spawn("rofi -show"))
```
