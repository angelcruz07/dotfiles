# Start up config

Create the startup configuration script at system boot

```bash
#Install
sudo pacman -S xorg-xinit
```

Create the file .xprofile if it does not exist

You add your programs, in my case

```bash
# Wallpaper
feh --bg-scale path/to/wallpeper.jpg
# Audio
pulseaudio &

```

More info [Wiki Arch]('https://wiki.archlinux.org/title/Xprofile')
