# Dotfiles

## Overview

![Qtile Enviroment](./assets/screenshots/Qtile.png)

## Description

This repository contains customized
configurations for a complete development
desktop environment, including Qtile, Neovim,
Fish, Zsh, Zellij, and terminal emulators like
WezTerm and Alacritty, along with essential utilities.

> **DISCLAIMER**
> This is my config with my preferences
> but you can customize it

<!--toc:start-->

- [Dotfiles](#dotfiles)
  - [Overview](#overview)
  - [Description](#description)
  - [Arch Installation](#arch-installation)
  - [Install Xorg](#install-xorg)
  - [Login and Window Manager](#login-and-window-manager)
  - [Initial Software](#initial-software)
    - [Enable Login Manager](#enable-login-manager)
    - [Clone Repository](#clone-repository)
    - [Install Fonts](#install-fonts)
    - [Copy Configurations](#copy-configurations)
    - [Reboot the PC](#reboot-the-pc)
    - [Install Homebrew](#install-homebrew)
    - [Install Arch User Repository (AUR)](#install-arch-user-repository-aur)
    - [Audio](#audio)
    - [Bluetooth](#bluetooth)
    - [Brightness](#brightness)
    - [Wallpaper](#wallpaper)
      - [Monitors](#monitors)
      - [Keybindings](#keybindings)
      - [Window Navigation](#window-navigation)
  - [Apps](#apps)
  - [Software](#software)
  - [Terminal](#terminal)
  - [Neovim Lazyvim](#neovim-lazyvim)
  - [Fonts, theming and GTK](#fonts-theming-and-gtk)
  - [Testing your window manager](#testing-your-window-manager)
      <!--toc:end-->

This guide will walk you through the
process of building a desktop environment
starting from a fresh Arch-based installation.
It assumes you are familiar with Linux-based
operating systems and command-line interfaces.
Since you're reading this, it's also assumed
that you've explored some "tiling window managers"
the place where the rabbit hole begins.
While you can use any window manager,
I will focus on Qtile, as that's what I started with.
This is a description of how I set up my desktop
environment from scratch.

## Arch Installation

The starting point of this guide is right
after completing a clean Arch-based distro installation.  
See the [Arch Installation Guide](https://wiki.archlinux.org/title/installation_guide)
for more details.  
My suggestions can be found in [Installation](install/README.md).

## Install Xorg

Xorg is an implementation of the
X Window System for Unix-like
operating systems, such as Linux.
It is a key component for providing a graphical interface on these systems.

Install Xorg:

```bash
sudo pacman -S xorg --noconfirm
```

## Login and Window Manager

First, we need to be able to log in and open programs like a browser and terminal. We will start by installing LightDM and Qtile. Note that LightDM requires a greeter to work. We'll also need a terminal and text editor.

## Initial Software

To make this configuration work, we need to install some basic software:

```bash
sudo pacman -S lightdm lightdm-gtk-greeter lightdm-webkit2-greeter \
qtile wezterm firefox rofi neofetch htop base-devel pulseaudio \
pavucontrol feh exa neovim flameshot unzip thunar picom arandr \
brightnessctl --noconfirm
```

For details about this software, see the [Software](#software) section.

### Enable Login Manager

To enable logging in to Qtile, you need to enable LightDM:

```bash
sudo systemctl enable lightdm
```

### Clone Repository

Clone my configuration repository:

```bash
git clone https://github.com/angelcruz07/dotfiles.git
```

### Install Fonts

Before continuing, let's install the fonts used in my configuration.
I use **IosevkaTerm**, **CascadiaCode**, and **Ubuntu Mono Nerd**.

**Download Iosevka font** from its official site
or from [Nerd Fonts GitHub](https://github.com/ryanoasis/nerd-fonts)
or install it directly:

```bash
sudo pacman -S ttf-ubuntu-mono-nerd ttf-cascadia-code ttf-iosevkaterm-nerd
```

### Copy Configurations

Copy my configurations to apply the changes:

```bash
cp -r ~/dotfiles/AlexcodeQtile/qtile/ ~/.config/
cp -r ~/dotfiles/AlexcodeRofi/rofi/ ~/.config/
cp -r ~/dotfiles/AlexcodeNvim/nvim/ ~/.config/
cp -r ~/dotfiles/AlexcodeZellij/zellij/ ~/.config/
cp -r ~/dotfiles/AlexcodeDots/.* ~/
```

### Reboot the PC

Reboot your PC to check if everything is set up correctly:

```bash
reboot
```

If you've followed the steps, you should see
my environment with the theme I am currently using.
Don't forget to check the
[keyboard shortcuts](#keybindings).

### Install Homebrew

Homebrew is a package manager for macOS
and Linux that makes it easy to install
and keep packages up-to-date.

Install it with:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Add Homebrew to your shell profile:

```bash
# Replace 'YourUserName' with your username
(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/YourUserName/.bashrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
```

### Install Arch User Repository (AUR)

Install git if you don’t have it:

```bash
sudo pacman -S git
```

Clone the yay AUR helper repository:

```bash
sudo git clone https://aur.archlinux.org/yay-git.git
```

Build and install yay:

```bash
cd yay-git
makepkg -si
```

Remove the yay directory once installed:

```bash
rm -r yay-git
```

### Audio

Install PulseAudio and its control tools:

```bash
sudo pacman -S pulseaudio pavucontrol
```

### Bluetooth

To enable Bluetooth, start and enable the Bluetooth service:

```bash
sudo systemctl start bluetooth.service
sudo systemctl enable bluetooth.service
sudo systemctl status bluetooth.service
```

### Brightness

To manage screen brightness:

```bash
sudo pacman -S brightnessctl
```

### Wallpaper

Install **feh** to set your wallpaper, and configure it in your `.xprofile` file:

```bash
# Install feh
sudo pacman -S feh

# Set wallpaper in your .xprofile
feh --bg-scale /path/to/image.jpg
```

#### Monitors

To manage multiple monitors, install **arandr**:

```bash
sudo pacman -S arandr
```

Check my configuration in [xprofile](./AlexcodeDots/.xprofile).

#### Keybindings

- **mod**: Sets the mod key to the "super" key (usually the Windows key).
- **terminal**: Sets the default terminal emulator to WezTerm.
- **keys**: A list of key bindings for various actions in Qtile.

#### Window Navigation

| Key                 | Action                           |
| ------------------- | -------------------------------- |
| mod + j             | Move focus down                  |
| mod + k             | Move focus up                    |
| mod + shift + h     | Decrease master                  |
| mod + shift + l     | Increase master                  |
| mod + shift + j     | Move window down                 |
| mod + shift + k     | Move window up                   |
| mod + shift + f     | Toggle floating window           |
| mod + tab           | Change layout                    |
| mod + [1-9]         | Switch to workspace N (1-9)      |
| mod + shift + [1-9] | Move window to workspace N (1-9) |
| mod + period        | Focus next monitor               |
| mod + comma         | Focus previous monitor           |
| mod + w             | Kill window                      |
| mod + ctrl + r      | Restart window manager           |
| mod + ctrl + q      | Quit window manager              |

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
| mod + s         | Screenshot (scrot)          |
| mod + c         | Launch VsCode               |

## Software

List of software used in the desktop environment.

| Software               | Utility                                |
| ---------------------- | -------------------------------------- |
| arandr                 | Manage multiple screens                |
| pacman-contrib         | Pacman utilities                       |
| bat                    | View files with syntax highlighting    |
| blueman                | Bluetooth control                      |
| bluez                  | Bluetooth stack                        |
| bluez-utils            | Bluetooth utilities                    |
| brightnessctl          | Laptop screen brightness               |
| cbatticon              | Battery icon                           |
| exa                    | List files visually                    |
| feh                    | Wallpaper setter                       |
| flameshot              | Screenshot                             |
| libnotify              | Receive notifications                  |
| lxappearance           | GUI for changing themes                |
| network-manager-applet | NetworkManager systray                 |
| networkmanager         | Self explanatory                       |
| notification-daemon    | Notifications                          |
| ntfs-3g                | Read mounted USB in Windows            |
| picom                  | Compositor for Xorg                    |
| pip                    | Python package manager                 |
| pulseaudio             | Audio control                          |
| pulseaudio-bluetooth   | Bluetooth audio support for PulseAudio |
| qiv                    | Image viewer                           |
| ranger                 | Terminal based explorer                |
| rofi                   | Menu and window switcher               |
| scrot                  | Screenshots                            |
| thunar                 | Graphical file explorer                |
| udiskie                | Automounter                            |
| unzip                  | Unzip files                            |
| vlc                    | Media player                           |
| volumeicon             | Audio icon                             |
| xcb-util-cursor        | Change theme cursor                    |

## Terminal

| Software  | Utility           | Pacman                                                      |
| --------- | ----------------- | ----------------------------------------------------------- |
| Alacritty | Terminal emulator | [Alacritty](https://alacritty.org/)                         |
| Kitty     | Terminal emulator | [Kitty](https://sw.kovidgoyal.net/kitty/)                   |
| WezTerm   | Terminal emulator | [WezTerm](https://wezfurlong.org/wezterm/installation.html) |

## Neovim & Lazyvim

| Software          | Utility   | Pacman                             |
| ----------------- | --------- | ---------------------------------- |
| nvim              | Editor    | sudo pacman -S neovim              |
| xsel              | Clipboard | sudo pacman -S xsel                |
| fzf               | Finder    | sudo pacman -S fzf                 |
| ripgrep           | Finder    | sudo pacman -S ripgrep             |
| fd                | Finder    | sudo pacman -S fd                  |
| the_silver_search |           | sudo pacman -S the_silver_searcher |
| prettier          | Formater  | sudo pacman -S prettier            |

More info [Neovim](https://neovim.io/)
[LazyVim](http://www.lazyvim.org/)

## Fonts, theming and GTK

| Software              | Utility                                                                                     |
| --------------------- | ------------------------------------------------------------------------------------------- |
| UbuntuMono Nerd Fonts | [Font](https://archlinux.org/packages/extra/any/ttf-ubuntu-mono-nerd/)                      |
| Cascadia Code         | [Font](https://archlinux.org/packages/extra/any/ttf-cascadia-code/)                         |
| Theme GTK             | [Icons](https://www.gnome-look.org/p/1333360) [Theme](https://www.gnome-look.org/p/1316887) |

## Testing your window manager

[Xephyr](https://wiki.archlinux.org/title/Xephyr)
