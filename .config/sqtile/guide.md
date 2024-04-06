## Qtile & lightdm

Software and setup guide for arch linux distruibution
Window manager in system Unix.

## Lightdm

Login Manager

1-. Unistall the default desktop environment

Install Qtile & lightdm

```bash
sudo pacman -S qtile lightdm
```

Activate login manager.

```bash
sudo systemctl enable lightdm

#Basic configuration to make it work

sudo pacman -S lightdm-gtk-greeter

#  Standart terminal emulador
sudo pacman -S xterm


# Do  a reboot
reboot
```

You will have a terminal, it is not a big deal but it is useful

It would be advisable to install firefox if you don't have it yet you can verify with the following command

```
firefox
```

Otherwise

```bash
sudo pacman -S firefox

#start

firefox
```

Install Alacritty terminal emulator

[Instal guide ](hIJttps://github.com/alacritty/alacritty/blob/master/INSTALL.md#arch-linux)

```bash
sudo pacman -S alacrity
```

Configura alacritty como terminal por defecto

```
#open terminal
cmod + enter
```

Keyboard in spanish

```
setxkbmap es
```

You can install vscode to edit the

# Vs code

```bash
sudo pacman -S code
```

Open the directory Qtile

```bash
cd .config/Qtile

#Open with vscode

```

# Config

```python


```

menu de teclado
sudo pacman -S rofi
