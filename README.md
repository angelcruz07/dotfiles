# Dotfiles & Arch Linux

This is my desktop environment on Arch Linux. Currently, this setup
is supported on a laptop, an MSI Notebook with an AMD Ryzen 5-7530U
processor, and within my personal desktop with support for two monitors,
24 and 26 inches respectively.

## Table of contents

- [Table of contents](#table-of-contents)
  - [Overview](#overview)
  - [Arch Installation](#arch-installation)
  - [Install Xorg](#install-xorg)
  - [Login and window manager](#login-and-window-manager)
  - [Initial software](#initial-software)
  - [Install (AUR)](#install-arch-user-repository-aur)
  - [Audio](#audio)
  - [Brightness](#brightness)
  - [Wallapaper](#wallapaper)
  - [Monitors](#monitors)
  - [Keybindings](#keybindings)
  - [Extras](#extras)
  - [Apps](#apps)
  - [Software](#software)
  - [Basic utilities](#basic-utilities)
  - [Audio](#audio-bluetooth)
  - [Video \& Images](#video--images)
  - [Terminal](#terminal)
  - [Text editor](#text-editor)
  - [Neovim](#neovim)
  - [Additional features](#additional-features)
  - [Fonts, theming and GTK](#fonts-theming-and-gtk)

## Overview

This guide will walk you through the process of building
a desktop environment starting with a fresh Arch based installation.
I will assume that you are comfortable with Linux based operating systems
and command line interfaces. Because you are reading this,
I will also assume that you've looked through some
"tiling window manager" videos on Youtube,
because that's where the rabbit hole starts.
You can pick any window managers you want,
but I'm going to use Qtile as a first tiling
window manager because that's what I started with.
This is basically a description of how I made my desktop environment from scratch.

## Arch Installation

The starting point of this guide is a right after
a complete clean Arch based distro installation.
Wiki [arch](https://wiki.archlinux.org/title/installation_guide)
My recomendations [Installation](/install/README.md)

## Install Xorg

Before proceeding, you should have Xorg installed

```bash
sudo pacman -S xorg
```

## Login and window manager

First, we need to be able to login and open some programs
like a browser and a terminal, so we'll start by installing
lighdm and qtile. Lightdm will not work unless we install a greeter.
We also need xterm because that's the terminal emulator qtile
will open by default, until we change the config file. Then,
a text editor is necessary for editing config files, you can
use vscode or jump straight into neovim if you have previous
experience, otherwise I wouldn't suggest it. Last but not
least, we need a browser.

## Initial software

Note: This comand will install the next
sotfware:

- lightdm
- Qtile
- Alacritty
- Vs Code
- Firefox
- Rofi
- Neofetch
- Base devel
- exa
- unzip
- Thunar
- Flameshot
- Htop
- NeoVim
- Picom

you can modify it your way.

1. Install basic software

```bash
sudo pacman -S lightdm lighdm-gtk-greeter lightdm-webkit2-greeter
qtile alacritty firefox rofi neofetch htop rofi neofetch htop
base-devel exa neovim flameshot unzip thunar picom
```

Info about this software in [Software](#software)

2. Enable login manager

```bash
sudo systemctl enable lightdm
```

## Install Arch User Repository (AUR)

```bash
# Verify if you have git installed
sudo pacman -S git

# Clone repository
sudo git clone https:aur.archlinux.org/yay-git.git

# Install yay
sudo chown -R youruser:youruser ./yay-git

cd yay-git

feh --bg-scale wallpapers/forest-violet.jpg &
makepkg -si

```

## Audio

```bash
sudo pacman -S pulseaudio pavucontrol
```

## Bluetooth

```bash
sudo systemctl start bluetooth.service
sudo systemctl enable bluetooth.service
sudo systemctl status bluetooth.service
```

## Brightness

Config keys laptop of brightness.

```bash
sudo pacman -S brightnessctl
```

## Wallapaper

Install the software feh to set the wallpaper
Configure your **.xprofile** file to set your
background when you boot your PC.

```bash
# Install feh
sudo pacman -S feh

# Set wallpaper in your file .xprofile
feh --bg-scale /path/to/image.jpg
```

## Monitors

Install graphic software for managing monitors

```bash
sudo pacman -S arandr
```

Check my config in [xprofile](/.xprofile)

## Keybindings

| Key                 | Action                           |
| ------------------- | -------------------------------- |
| mod + j             | next window (down)               |
| mod + k             | next window (up)                 |
| mod + shift + h     | decrease master                  |
| mod + shift + l     | increase master                  |
| mod + shift + j     | move window down                 |
| mod + shift + k     | move window up                   |
| mod + shift + f     | toggle floating                  |
| mod + tab           | change layout                    |
| mod + [1-9]         | Switch to workspace N (1-9)      |
| mod + shift + [1-9] | Send Window to workspace N (1-9) |
| mod + period        | Focus next monitor               |
| mod + comma         | Focus previous monitor           |
| mod + w             | kill window                      |
| mod + ctrl + r      | restart wm                       |
| mod + ctrl + q      | quit window                      |

The following keybindings will only work if you install all programs needed:

```bash
sudo pacman -S rofi thunar firefox alacritty redshift scrot
```

## Apps

| Key             | Action                      |
| --------------- | --------------------------- |
| mod + m         | Launch rofi                 |
| mod + shift + m | Window nav (rofi)           |
| mod + b         | Lunch Browser(Firefox)      |
| mod + e         | Lunch File explores(thunar) |
| mod + return    | Luch Terminal (Alacritty)   |
| mod + r         | Redshift                    |
| mod + shift + r | Stop redshift               |
| mod + s         | screenshot (scrot)          |
| mod + c         | Launch VsCode               |

## Gallery

My setup has the followig themes
avaible.

## Qtile

- Dracula
  ![Dracula theme](./assets/screenshots/dracula.jpg)
- Tokyo night
  ![Tokyo Night](./assets/screenshots/tokyo-night.png)
- King
- Dark-grey
- Material-darker
- Material-ocean
- Monokai-pro
- Nord-wave
- Nord

## Software

List of software used in the desktop environment

## Basic utilities

| Software               | Utility                     | Pacman                                |
| ---------------------- | --------------------------- | ------------------------------------- |
| networkmanager         | Self explanatory            | sudo pacman -S networkmanager         |
| ntfs                   | Read mounted usb in windows | sudo pacman -S ntfs-3g                |
| thunar                 | Graphical file explorer     | sudo pacman -S thunar                 |
| unzip                  | Uzip files                  | sudo pacman -S unzip                  |
| network-manager-applet | Wifi icon                   | sudo pacman -S network-manager-applet |
| cbattion               | Baterry Icon                | sudo pacman -S cbatticon              |
| notification deamon    | Notification                | sudo pacman -S notification-daemon    |
| lib notify             | Recibir notificaciones      | sudo pacman -S libnotify              |
| picom                  | Composer                    | sudo pacman -S picom                  |
| flameshot              | Screenshot                  | sudo pacman -S flameshot              |

## Audio & bluetooth

| Software             | Utility           | Pacman                              |
| -------------------- | ----------------- | ----------------------------------- |
| Pulse Audio          | Audio control     | sudo pacman -S pulseaudio           |
| volumen icon         | Icon audio        | sudo pacman -S volumeicon           |
| bluez bluez-utis     | Bluetooth         | sudo pacman -S bluez bluez-utils    |
| pulseaudio-bluetooth | Bluetooth         | sudo pacman -S pulseaudio-bluetooth |
| blueman              | Bluetooth Control | sudo pacman -S blueman              |

## Video & Images

| Software | Utility     | Pacman                |
| -------- | ----------- | --------------------- |
| Vlc      | Show Video  | sudo pacman -S vlc    |
| Qeeqie   | Show images | sudo pacman -S geeqie |
| scrot    | Screenshots | Sudo pacman -S scrot  |

## Terminal

| Software  | Utility           | Pacman                   |
| --------- | ----------------- | ------------------------ |
| Alacritty | Terminal emulator | sudo pacman -S alacritty |
| Kitty     | Terminal emulator | sudo pacman -S kitty     |

## Text editor

| Software    | Utility     | Pacman                |
| ----------- | ----------- | --------------------- |
| neovim      | Text editor | sudo pacman -S neovim |
| visual code | Text editor | sudo pacman -S code   |

## Neovim

| Software          | Utility   | Pacman                             |
| ----------------- | --------- | ---------------------------------- |
| xsel              | Clipboard | sudo pacman -S xsel                |
| fzf               | Finder    | sudo pacman -S fzf                 |
| ripgrep           | Finder    | sudo pacman -S ripgrep             |
| fd                | Finder    | sudo pacman -S fd                  |
| the_silver_search |           | sudo pacman -S the_silver_searcher |
| prettier          | Formater  | sudo pacman -S prettier            |

More info [Neovim](https://neovim.io/)

## Additional features

| Software        | Utility                 | Pacman                         |
| --------------- | ----------------------- | ------------------------------ |
| ArandDR         | Manage multiple screens | sudo pacman -S arandr          |
| xappearance     | Change theme            | sudo pacman -S lxappearance    |
| pip             | Python package manager  | sudo pacman -s python-pip      |
| exa             | List files visually     | sudo pacman -S exa             |
| xcb-util-cursor | Change theme cursor     | sudo pacman -S xcb-util-cursor |

## Fonts, theming and GTK

| Software              | Utility                                                                                      |
| --------------------- | -------------------------------------------------------------------------------------------- |
| Alacritty             | Terminal emulator                                                                            |
| Exa                   | Pager                                                                                        |
| Bat                   | Pager                                                                                        |
| UbuntuMono Nerd Fonts | [Font](https://archlinux.org/packages/extra/any/ttf-ubuntu-mono-nerd/)                       |
| Cascadia Code         | [Font](https://archlinux.org/packages/extra/any/ttf-cascadia-code/)                          |
| Theme GTK             | [Iconst](https://www.gnome-look.org/p/1333360) [Theme](https://www.gnome-look.org/p/1316887) |

Testing your window manager
[Xephyr](https://wiki.archlinux.org/title/Xephyr)

## How to use my setup

After a clean installation of Archlinux.

- Installl software

```bash
sudo pacman -S lightdm lighdm-gtk-greeter lightdm-webkit2-greeter
qtile alacritty firefox rofi neofetch htop rofi neofetch htop
base-devel exa neovim flameshot unzip thunar pulseaudio pavucontrol
brightnessctl feh arandr picom
```

Before continuing, it is recommended to restart the PC.

- Clone this repository

```bash
https://github.com/angelcruz07/dotfiles.git
```

- Copy my .config of desktop

```bash
cp -r ~/dotfiles/AlexcodeDesktop/.config/ ~/
```

4. Copy .bashrc

```bash
cp -r ~/dotfiles/.bashrc/ ~/
```

5. Copy .xprofile

```bash
cp -r ~/dotfiles/.xprofile ~/
```

After this, you should restart the PC and you will have my setup.

## How to customize it?
