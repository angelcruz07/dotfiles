# Dotfiles & Configs Arch Linux

# Table of contents

## Overview

This guide will walk you through the process of building a desktop environment starting with a fresh Arch based installation. I will assume that you are comfortable with Linux based operating systems and command line interfaces. Because you are reading this, I will also assume that you've looked through some "tiling window manager" videos on Youtube, because that's where the rabbit hole starts. You can pick any window managers you want, but I'm going to use Qtile as a first tiling window manager because that's what I started with. This is basically a description of how I made my desktop environment from scratch.

## Arch Installation

The starting point of this guide is a right after a complete clean Arch based distro installation.

## Login and window manager

First, we need to be able to login and open some programs like a browser and a terminal, so we'll start by installing lighdm and qtile. Lightdm will not work unless we install a greeter. We also need xterm because that's the terminal emulator qtile will open by default, until we change the config file. Then, a text editor is necessary for editing config files, you can use vscode or jump straight into neovim if you have previous experience, otherwise I wouldn't suggest it. Last but not least, we need a browser.

```bash
sudo pacman -S lightdm lightdm-gtk-greeter qtile xterm code firefox
```

## Basic Qtile configuration

Now that you're in Qtile, you should know some of the default keybindings.

## Audio

```bash
sudo pacman -S pulseaudio

# Install
sudo pacman -S pavucontrol
```

## Brightness

Add config in #pending

```bash
sudo pacman -S brightnessctl
```

## YAY INSTALL

# Apps

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

# Software

## Basic utilities

| Software       | Utility           | Pacman                        |
| -------------- | ----------------- | ----------------------------- |
| Networkmanager | Self explanatory  | sudo pacman -S networkmanager |
| Alacritty      | Terminal emulator | sudo pacman -S alacritty      |
| Celda4         | Celda5            |

## Fonts, theming and GTK

| Software  | Utility           |
| --------- | ----------------- |
| Alacritty | Terminal emulator |
| Celda4    | Celda5            |

## Apps

| Software  | Utility                 |
| --------- | ----------------------- |
| Alacritty | Terminal emulator       |
| Thunar    | Graphical file explorer |
| ranger    | Terminal based explorer |
| scrot     | Screenshot              |
| neovim    | Terminal based editor   |
| rofi      | Take care of yout eyes  |
| trayer    | Systray                 |
